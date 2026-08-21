import 'dart:async';
import 'dart:io';

import 'package:crypter/core/app/firebase_options.dart';
import 'package:crypter/core/app/navigation/router.dart';
import 'package:crypter/domain/repositories/notifications_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:talker/talker.dart';

const String kVapidKey =
    'BNoMvvVKpWqpBzrPg02A8l4zHSv7hph19bwgqrcfuPIiJqqpfzrEShNd1YKEKcL2JFgBt96mXRf7jZRAKLA4U6E';
const String kRoute = 'route';

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage remoteMessage) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class NotificationsRepositoryImpl implements NotificationsRepository {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final FirebaseMessaging _firebaseMessaging;
  final LocalStorageService _sharedPreferencesService;
  final AppRouter router;
  final Talker _talker;

  NotificationsRepositoryImpl(this._sharedPreferencesService, this.router, this._talker)
    : _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin(),
      _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<void> initialize() async {
    _initializeFlutterLocalNotifications();
    _initializeFirebaseMessaging();

    final token = kIsWeb
        ? await _firebaseMessaging.getToken(vapidKey: kVapidKey)
        : Platform.isAndroid
        ? await _firebaseMessaging.getToken()
        : await _firebaseMessaging.getAPNSToken();
    if (token != null) {
      _sharedPreferencesService.setFirebaseMessagingToken(token);
    }

    _talker.info('Initialized notifications');
  }

  void _initializeFlutterLocalNotifications() async {
    final webSettings = WebInitializationSettings();
    final androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iosSettings = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final initializationSettings = InitializationSettings(
      web: webSettings,
      android: androidSettings,
      iOS: iosSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) {
        final payload = notificationResponse.payload;

        if (payload != null) {
          router.navigateFromPushNotification(payload);
        }
      },
    );

    _talker.info('Initialized Flutter Local Notifications');
  }

  void _initializeFirebaseMessaging() async {
    if (!kIsWeb) {
      FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    }

    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      router.navigateFromPushNotification(initialMessage.data[kRoute]);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      router.navigateFromPushNotification(remoteMessage.data[kRoute]);
    });

    if (!kIsWeb && Platform.isIOS) {
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    FirebaseMessaging.onMessage.listen((remoteMessage) async {
      showNotification(
        title: remoteMessage.notification?.title,
        body: remoteMessage.notification?.body,
        payload: remoteMessage.data[kRoute],
      );
    });

    _talker.info('Initialized Firebase Messaging');
  }

  @override
  Future<bool> isPermissionGranted() async {
    if (kIsWeb) {
      final status = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<WebFlutterLocalNotificationsPlugin>()
          ?.permissionStatus;
      return status == WebNotificationPermission.granted;
    } else if (Platform.isAndroid) {
      return await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
    } else {
      final hasPermission = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.checkPermissions();
      return hasPermission?.isEnabled ?? false;
    }
  }

  @override
  Future<bool> requestPermission() async {
    await _firebaseMessaging.requestPermission(alert: true, badge: true, sound: true);

    if (kIsWeb) {
      final token = await _firebaseMessaging.getToken(vapidKey: kVapidKey);
      if (token != null) {
        _sharedPreferencesService.setFirebaseMessagingToken(token);
      }

      return await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<WebFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission() ??
          false;
    } else if (Platform.isAndroid) {
      final token = await _firebaseMessaging.getToken();
      if (token != null) {
        _sharedPreferencesService.setFirebaseMessagingToken(token);
      }

      return await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission() ??
          false;
    } else {
      final token = await _firebaseMessaging.getAPNSToken();
      if (token != null) {
        _sharedPreferencesService.setFirebaseMessagingToken(token);
      }

      return await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(alert: true, badge: true, sound: true) ??
          false;
    }
  }

  @override
  Future<void> showNotification({String? title, String? body, String? payload}) async {
    final webDetails = WebNotificationDetails();
    final androidDetails = AndroidNotificationDetails(
      '0',
      'channel_notification',
      channelDescription: 'android channel',
      icon: '@mipmap/ic_launcher',
    );
    final iosDetails = DarwinNotificationDetails();

    final notificationDetails = NotificationDetails(
      web: webDetails,
      android: androidDetails,
      iOS: iosDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id: 0,
      notificationDetails: notificationDetails,
      title: title,
      body: body,
      payload: payload,
    );

    _talker.info('Shown a notification with\ntitle: $title\nbody: $body\npayload: $payload');
  }
}
