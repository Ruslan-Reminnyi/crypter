/// Chart Endpoints
// usage example: ChartEndpoints.binanceApi.klines
class ChartEndpoints {
  static final binanceApi = _BinanceApiEndpoints();
  static final binanceWebSocket = _BinanceWebSocketApiEndpoints();
}

enum _ApiVersion {
  v3('/api/v3');

  final String path;

  const _ApiVersion(this.path);
}

abstract interface class _EndpointModule {
  String get path;
}

class _BinanceApiEndpoints extends _EndpointModule {
  @override
  String get path => 'klines';

  String get klines {
    return '${_ApiVersion.v3.path}/$path';
  }
}

class _BinanceWebSocketApiEndpoints extends _EndpointModule {
  @override
  String get path => 'wss://stream.binance.com:9443/ws';

  String get home => path;

  String klineStreams(String symbol, String interval) => '$symbol@kline_$interval';
}
