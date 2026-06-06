part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
WebSocketService binanceWebSocketService(Ref ref) =>
    BinanceWebSocketService(ref.watch(webSocketChannelProvider));
