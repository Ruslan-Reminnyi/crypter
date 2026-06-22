import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/presentation/features/chart/chart_screen.dart';
import 'package:crypter/presentation/features/orders/orders_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router;

  AppRouter()
    : router = GoRouter(
        navigatorKey: navigatorKey,
        initialLocation: AppRoutes.chart.path,
        routes: [
          GoRoute(
            path: AppRoutes.chart.path,
            builder: (context, state) => const ChartScreen(title: 'Crypter'),
            routes: [
              GoRoute(
                path: AppRoutes.ordersHistory.path,
                builder: (context_, state) => OrdersHistoryScreen(),
              ),
            ],
          ),
        ],
      );
}
