// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredOrders)
final filteredOrdersProvider = FilteredOrdersFamily._();

final class FilteredOrdersProvider
    extends $FunctionalProvider<List<Order>, List<Order>, List<Order>>
    with $Provider<List<Order>> {
  FilteredOrdersProvider._({
    required FilteredOrdersFamily super.from,
    required OrderTab super.argument,
  }) : super(
         retry: null,
         name: r'filteredOrdersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredOrdersHash();

  @override
  String toString() {
    return r'filteredOrdersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Order>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Order> create(Ref ref) {
    final argument = this.argument as OrderTab;
    return filteredOrders(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Order> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Order>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredOrdersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredOrdersHash() => r'c77911ac5ff76eeafb728def365e77251b4f4e83';

final class FilteredOrdersFamily extends $Family
    with $FunctionalFamilyOverride<List<Order>, OrderTab> {
  FilteredOrdersFamily._()
    : super(
        retry: null,
        name: r'filteredOrdersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredOrdersProvider call(OrderTab ordersTab) =>
      FilteredOrdersProvider._(argument: ordersTab, from: this);

  @override
  String toString() => r'filteredOrdersProvider';
}
