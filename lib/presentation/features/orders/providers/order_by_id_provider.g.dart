// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderById)
final orderByIdProvider = OrderByIdFamily._();

final class OrderByIdProvider extends $FunctionalProvider<Order, Order, Order>
    with $Provider<Order> {
  OrderByIdProvider._({
    required OrderByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'orderByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderByIdHash();

  @override
  String toString() {
    return r'orderByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Order> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Order create(Ref ref) {
    final argument = this.argument as int;
    return orderById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Order value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Order>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is OrderByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderByIdHash() => r'30348383f38e5936a59ad1c4078c85b86e032ac9';

final class OrderByIdFamily extends $Family
    with $FunctionalFamilyOverride<Order, int> {
  OrderByIdFamily._()
    : super(
        retry: null,
        name: r'orderByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderByIdProvider call(int id) =>
      OrderByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'orderByIdProvider';
}
