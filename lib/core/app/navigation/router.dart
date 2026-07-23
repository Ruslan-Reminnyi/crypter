import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/domain/enums/order_tab.dart';
import 'package:crypter/domain/repositories/auth_repository.dart';
import 'package:crypter/presentation/features/auth/login_screen.dart';
import 'package:crypter/presentation/features/auth/registration_screen.dart';
import 'package:crypter/presentation/features/chart/chart_screen.dart';
import 'package:crypter/presentation/features/orders/orders_screen.dart';
import 'package:crypter/presentation/features/orders/pages/order_page.dart';
import 'package:crypter/presentation/features/orders/pages/filtered_orders_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router;
  // ignore: unused_field
  final AuthRepository _authRepository;

  AppRouter(this._authRepository)
    : router = GoRouter(
        navigatorKey: rootNavigatorKey,
        initialLocation: AppRoutes.login.path,
        redirect: (_, state) {
          final path = state.uri.path;
          final isAuthPath = path == AppRoutes.login.path || path == AppRoutes.signUp.path;
          final isLoggedIn = _authRepository.isLoggedIn;

          if (!isAuthPath && !isLoggedIn) {
            return AppRoutes.login.path;
          }

          if (isAuthPath && isLoggedIn) {
            return AppRoutes.chart.path;
          }

          return null;
        },
        routes: [
          GoRoute(
            name: AppRoutes.login.name,
            path: AppRoutes.login.path,
            builder: (_, _) => const LoginScreen(),
          ),
          GoRoute(
            name: AppRoutes.signUp.name,
            path: AppRoutes.signUp.path,
            builder: (_, _) => const RegistrationScreen(),
          ),
          GoRoute(
            name: AppRoutes.chart.name,
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
                        name: AppRoutes.allOrders.name,
                        path: AppRoutes.allOrders.path,
                        builder: (_, _) => FilteredOrdersPage(OrderTab.all),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        name: AppRoutes.workingOrders.name,
                        path: AppRoutes.workingOrders.path,
                        builder: (_, _) => FilteredOrdersPage(OrderTab.working),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        name: AppRoutes.filledOrders.name,
                        path: AppRoutes.filledOrders.path,
                        builder: (_, _) => FilteredOrdersPage(OrderTab.filled),
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                name: AppRoutes.order.name,
                path: AppRoutes.orderPath,
                parentNavigatorKey: rootNavigatorKey,
                builder: (_, state) {
                  final idString = state.pathParameters['id'];
                  int? id;
                  if (idString != null) {
                    id = int.tryParse(idString);
                  }
                  return OrderPage(id);
                },
              ),
            ],
          ),
        ],
      );
}
