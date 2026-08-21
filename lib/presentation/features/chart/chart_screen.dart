import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/presentation/common/dialogs/app_dialog.dart';
import 'package:crypter/presentation/features/chart/notifiers/chart_notifier.dart';
import 'package:crypter/presentation/features/chart/providers/crypto_info_repository_stream.dart';
import 'package:crypter/presentation/features/chart/widgets/chart_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChartScreen extends ConsumerWidget {
  final String title;

  const ChartScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: GestureDetector(
          onTap: () => context.go('${AppRoutes.chart.path}${AppRoutes.ai.path}'),
          child: Icon(Icons.question_answer_rounded),
        ),
        title: Text(title),
        actions: [
          if (kDebugMode)
            Tooltip(
              message: context.l10n.talkerScreen,
              child: GestureDetector(
                onTap: () => context.go('${AppRoutes.chart.path}${AppRoutes.talker.path}'),
                child: Icon(Icons.logo_dev_rounded),
              ),
            ),
          SizedBox(width: 2),
          GestureDetector(
            onTap: () => context.go('${AppRoutes.chart.path}${AppRoutes.allOrders.path}'),
            child: Icon(Icons.content_paste_rounded),
          ),
          SizedBox(width: 2),
          GestureDetector(
            onTap: () async {
              final isConfirmed = await AppDialog.logout(context);
              if (isConfirmed == true) {
                await ref.read(chartProvider.notifier).logout();
                if (context.mounted) {
                  context.go(AppRoutes.login.path);
                }
              }
            },
            child: Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: SizedBox.square(
        dimension: width,
        child: Column(
          children: [
            ChartSettings(),
            ref
                .watch(candlesProvider)
                .when(
                  data: (List<Candle> candles) => Flexible(child: Candlesticks(candles: candles)),
                  error: (Object error, StackTrace stackTrace) =>
                      Text("Error showing List<Candle> - $error\n$stackTrace"),
                  loading: () => const CircularProgressIndicator(),
                ),
          ],
        ),
      ),
    );
  }
}
