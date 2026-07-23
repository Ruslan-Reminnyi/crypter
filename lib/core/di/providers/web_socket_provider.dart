part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
WebSocketChannel webSocketChannel(Ref _) =>
    WebSocketChannel.connect(Uri.parse(ChartEndpoints.binanceWebSocket.home));
