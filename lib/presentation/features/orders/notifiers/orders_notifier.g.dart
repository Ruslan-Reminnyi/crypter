// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrdersNotifier)
final ordersProvider = OrdersNotifierProvider._();

final class OrdersNotifierProvider
    extends $NotifierProvider<OrdersNotifier, List<Order>> {
  OrdersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersNotifierHash();

  @$internal
  @override
  OrdersNotifier create() => OrdersNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Order> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Order>>(value),
    );
  }
}

String _$ordersNotifierHash() => r'77b9e69e97e06dd47af4ab9fab7374bebefb4d4a';

abstract class _$OrdersNotifier extends $Notifier<List<Order>> {
  List<Order> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Order>, List<Order>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Order>, List<Order>>,
              List<Order>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
