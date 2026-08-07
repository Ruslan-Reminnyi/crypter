import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_messaging_notification.freezed.dart';
part 'firebase_messaging_notification.g.dart';

@freezed
abstract class FirebaseMessagingNotification with _$FirebaseMessagingNotification {
  static const String kFirebaseMessagingToken = 'fcm_token';

  const FirebaseMessagingNotification._();

  @JsonSerializable(fieldRename: .snake)
  const factory FirebaseMessagingNotification({
    int? orderId,
    required String platform,
    required String symbol,
    required String side,
    required double stopLoss,
    @JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken)
    String? firebaseMessagingToken,
  }) = _FirebaseMessagingNotification;

  factory FirebaseMessagingNotification.fromJson(Map<String, dynamic> json) =>
      _$FirebaseMessagingNotificationFromJson(json);
}
