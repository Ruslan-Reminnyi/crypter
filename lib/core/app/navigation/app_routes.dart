enum AppRoutes {
  login,
  signUp,
  chart,
  orders,
  order,
  allOrders,
  workingOrders,
  filledOrders,
  ai;

  static String get orderPath => '${AppRoutes.order.path}/:id';

  static String get orderFullPath => '${AppRoutes.chart.path}${AppRoutes.order.path}/:id';

  static String orderPageFullPath(int id) => '${AppRoutes.chart.path}${AppRoutes.order.path}/$id';
}

extension AppRoutesType on AppRoutes {
  String get path => switch (this) {
    AppRoutes.login => '/login',
    AppRoutes.signUp => '/sign_up',
    AppRoutes.chart => '/chart',
    AppRoutes.orders => '/orders',
    AppRoutes.order => '/order',
    AppRoutes.allOrders => '${AppRoutes.orders.path}/all',
    AppRoutes.workingOrders => '${AppRoutes.orders.path}/working',
    AppRoutes.filledOrders => '${AppRoutes.orders.path}/filled',
    AppRoutes.ai => '/ai',
  };
}
