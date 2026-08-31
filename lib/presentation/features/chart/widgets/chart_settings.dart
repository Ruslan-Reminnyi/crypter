import 'package:crypter/domain/enums/exchange.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/presentation/features/chart/notifiers/chart_notifier.dart';
import 'package:crypter/presentation/common/widgets/custom_dropdown_menu.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartSettings extends ConsumerWidget {
  const ChartSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chartProvider);
    final provider = ref.read(chartProvider.notifier);

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        CustomDropdownMenu<Symbol>(
          values: Symbol.values,
          initialSelection: state.symbol,
          itemBuilder: (symbol) => symbol.displayName,
          onSelected: (value) {
            if (value != null) provider.changeSymbol(value);
          },
          width: 160,
        ),
        CustomDropdownMenu<Interval>(
          values: Interval.values,
          initialSelection: state.interval,
          itemBuilder: (interval) => interval.timeframe,
          onSelected: (value) {
            if (value != null) provider.changeInterval(value);
          },
          width: 100,
        ),
        CustomDropdownMenu<Exchange>(
          values: Exchange.values,
          initialSelection: state.exchange,
          itemBuilder: (exchange) => exchange.displayName,
          onSelected: (value) {},
          width: 140,
        ),
      ],
    );
  }
}
