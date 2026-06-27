import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final VoidCallback onDelete;

  const OrderTile({super.key, required this.order, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(order.number.toString()),
      title: Text('${order.formatDateTime(false)}'),
      trailing: GestureDetector(onTap: onDelete, child: Icon(Icons.close_rounded)),
      onTap: () => context.push(AppRoutes.orderPage(order.number)),
    );
  }
}
