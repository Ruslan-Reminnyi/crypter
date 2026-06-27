import 'package:crypter/domain/enums/order_tab.dart';
import 'package:crypter/presentation/common/dialogs/deletion_dialog.dart';
import 'package:crypter/presentation/features/orders/notifiers/orders_notifier.dart';
import 'package:crypter/presentation/features/orders/providers/filtered_orders_provider.dart';
import 'package:crypter/presentation/features/orders/widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilteredOrdersPage extends ConsumerWidget {
  final OrderTab orderTab;

  const FilteredOrdersPage(this.orderTab, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(filteredOrdersProvider(orderTab));

    if (orders.isEmpty) {
      return SizedBox.shrink();
    }

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) => OrderTile(
        order: orders[index],
        onDelete: () async {
          final isDeleted = await showDeletionDialog(context);

          if (isDeleted == true) {
            ref.read(ordersProvider.notifier).deleteOrder(orders[index].number);
          }
        },
      ),
    );
  }
}
