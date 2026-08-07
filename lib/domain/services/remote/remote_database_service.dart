import 'dart:async';

import 'package:crypter/data/models/firebase_messaging_notification/firebase_messaging_notification.dart';
import 'package:crypter/data/models/order/order.dart';

abstract interface class RemoteDatabaseService {
  Future<List<Order>> getAllOrders();
  Future<int> createOrder(Order order);
  Future<Order> getOrder(int id);
  Future<void> updateOrder(Order order);
  Future<void> deleteOrder(int id);

  Future<void> getStopLossNotifications(
    FirebaseMessagingNotification firebaseMessagingNotification,
  );
}
