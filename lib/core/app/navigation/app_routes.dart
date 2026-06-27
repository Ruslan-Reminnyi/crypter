enum AppRoutes {
  chart,
  orders,
  order,
  allOrders,
  workingOrders,
  filledOrders;

  static String get orderPagePath => '${AppRoutes.order}/:number';

  static String orderPage(int number) => '${AppRoutes.order}/$number';
}

extension AppRoutesType on AppRoutes {
  String get path => switch (this) {
    AppRoutes.chart => '/',
    AppRoutes.orders => '/orders',
    AppRoutes.order => '/order',
    AppRoutes.allOrders => '${AppRoutes.orders.path}/all',
    AppRoutes.workingOrders => '${AppRoutes.orders.path}/working',
    AppRoutes.filledOrders => '${AppRoutes.orders.path}/filled',
  };
}
