// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderById)
final orderByIdProvider = OrderByIdFamily._();

final class OrderByIdProvider
    extends $FunctionalProvider<AsyncValue<Order>, Order, FutureOr<Order>>
    with $FutureModifier<Order>, $FutureProvider<Order> {
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
  $FutureProviderElement<Order> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Order> create(Ref ref) {
    final argument = this.argument as int;
    return orderById(ref, argument);
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

String _$orderByIdHash() => r'c8928a0d04f915ffea9748e8f5ca2f5ad0c881a2';

final class OrderByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Order>, int> {
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
