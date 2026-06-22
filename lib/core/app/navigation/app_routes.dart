enum AppRoutes { chart, ordersHistory }

extension AppRoutesType on AppRoutes {
  String get path => switch (this) {
    AppRoutes.chart => '/',
    AppRoutes.ordersHistory => '/orders_history',
  };
}
