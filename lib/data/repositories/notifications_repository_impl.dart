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

const String vapid =
    'BNoMvvVKpWqpBzrPg02A8l4zHSv7hph19bwgqrcfuPIiJqqpfzrEShNd1YKEKcL2JFgBt96mXRf7jZRAKLA4U6E';

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage remoteMessage) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  print('onBackgroundMessage $remoteMessage');
}

class NotificationsRepositoryImpl implements NotificationsRepository {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final FirebaseMessaging _firebaseMessaging;
  final LocalStorageService _sharedPreferencesService;
  final AppRouter router;

  NotificationsRepositoryImpl(this._sharedPreferencesService, this.router)
    : _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin(),
      _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<void> initialize() async {
    _initializeLocalNotifications();
    _initializeFirebaseMessagin();
    final token = await _firebaseMessaging.getToken();
    if (token != null) {
      _sharedPreferencesService.setFirebaseMessagingToken(token);
    }
  }

  void _initializeFirebaseMessagin() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      router.navigateFromPushNotification(initialMessage.data['route']);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      router.navigateFromPushNotification(remoteMessage.data['route']);
    });

    if (Platform.isAndroid) {
      FirebaseMessaging.onMessage.listen((remoteMessage) async {
        showNotification(
          title: remoteMessage.notification?.title,
          body: remoteMessage.notification?.body,
          payload: remoteMessage.data['route'],
        );
      });
    }
  }

  void _initializeLocalNotifications() async {
    final WebInitializationSettings webInitializationSettings = WebInitializationSettings();
    final AndroidInitializationSettings androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    final IOSInitializationSettings iosSettings = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    final InitializationSettings initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
      web: webInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        final payload = notificationResponse.payload;

        if (payload != null) {
          router.navigateFromPushNotification(payload);
        }
      },
    );
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
      final token = await _firebaseMessaging.getToken(vapidKey: vapid);
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
    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      '0',
      'channel_notification',
      channelDescription: 'android channel',
      icon: '@mipmap/ic_launcher',
    );
    final DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await _flutterLocalNotificationsPlugin.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
      payload: payload,
    );
  }
}
