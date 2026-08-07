// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_messaging_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FirebaseMessagingNotification _$FirebaseMessagingNotificationFromJson(
  Map<String, dynamic> json,
) => _FirebaseMessagingNotification(
  orderId: (json['order_id'] as num?)?.toInt(),
  platform: json['platform'] as String,
  symbol: json['symbol'] as String,
  side: json['side'] as String,
  stopLoss: (json['stop_loss'] as num).toDouble(),
  firebaseMessagingToken: json['fcm_token'] as String?,
);

Map<String, dynamic> _$FirebaseMessagingNotificationToJson(
  _FirebaseMessagingNotification instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'platform': instance.platform,
  'symbol': instance.symbol,
  'side': instance.side,
  'stop_loss': instance.stopLoss,
  'fcm_token': instance.firebaseMessagingToken,
};
