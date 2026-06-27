// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_by_number_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderByNumber)
final orderByNumberProvider = OrderByNumberFamily._();

final class OrderByNumberProvider
    extends $FunctionalProvider<Order, Order, Order>
    with $Provider<Order> {
  OrderByNumberProvider._({
    required OrderByNumberFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'orderByNumberProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderByNumberHash();

  @override
  String toString() {
    return r'orderByNumberProvider'
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
    return orderByNumber(ref, argument);
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
    return other is OrderByNumberProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderByNumberHash() => r'7d8676b999d3f60713f6465c3c15a0e96c00a270';

final class OrderByNumberFamily extends $Family
    with $FunctionalFamilyOverride<Order, int> {
  OrderByNumberFamily._()
    : super(
        retry: null,
        name: r'orderByNumberProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderByNumberProvider call(int number) =>
      OrderByNumberProvider._(argument: number, from: this);

  @override
  String toString() => r'orderByNumberProvider';
}
