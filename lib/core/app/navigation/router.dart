import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/domain/enums/order_tab.dart';
import 'package:crypter/presentation/features/chart/chart_screen.dart';
import 'package:crypter/presentation/features/orders/orders_screen.dart';
import 'package:crypter/presentation/features/orders/pages/order_page.dart';
import 'package:crypter/presentation/features/orders/pages/filtered_orders_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router;

  AppRouter()
    : router = GoRouter(
        navigatorKey: rootNavigatorKey,
        initialLocation: AppRoutes.chart.path,
        routes: [
          GoRoute(
            name: AppRoutes.chart.path,
            path: AppRoutes.chart.path,
            builder: (_, _) => const ChartScreen(title: 'Crypter'),
            routes: [
              StatefulShellRoute.indexedStack(
                parentNavigatorKey: rootNavigatorKey,
                builder: (_, _, navigationShell) {
                  return OrdersScreen(navigationShell);
                },
                branches: [
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        name: AppRoutes.allOrders.path,
                        path: AppRoutes.allOrders.path,
                        builder: (_, _) => FilteredOrdersPage(OrderTab.all),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        name: AppRoutes.workingOrders.path,
                        path: AppRoutes.workingOrders.path,
                        builder: (_, _) => FilteredOrdersPage(OrderTab.working),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        name: AppRoutes.filledOrders.path,
                        path: AppRoutes.filledOrders.path,
                        builder: (_, _) => FilteredOrdersPage(OrderTab.filled),
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: AppRoutes.orderPagePath,
                parentNavigatorKey: rootNavigatorKey,
                builder: (_, state) {
                  final numberString = state.pathParameters['number'];
                  int? number;
                  if (numberString != null) {
                    number = int.tryParse(numberString);
                  }
                  return OrderPage(number);
                },
              ),
            ],
          ),
        ],
      );
}
