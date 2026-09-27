import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/extensions/build_context_extensions.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final VoidCallback onDelete;

  const OrderTile({super.key, required this.order, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.orderPageFullPath(order.id!)),
      child: Container(
        width: context.responsiveValue(
          mobile: () => .infinity,
          tablet: () => 180.0,
          desktop: () => 220.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              spacing: 16.0,
              children: [
                Text(
                  order.number.toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.colors.bodySmall,
                    fontSize: 18.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(order.symbol.name.toUpperCase()),
                          GestureDetector(
                            onTap: onDelete,
                            child: Icon(
                              Icons.close_rounded,
                              color: Theme.of(context).colorScheme.inverseSurface,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text('${order.formatDateTime(false)}'),
                          Text('${context.l10n.sl}: ${order.stopLoss}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
