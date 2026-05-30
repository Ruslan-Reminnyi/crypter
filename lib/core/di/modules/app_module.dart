import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/core/urls.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: binanceBaseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  @lazySingleton
  WebSocketChannel get webSocketChannel =>
      WebSocketChannel.connect(Uri.parse(binanceBaseWebSocketUrl));

  @lazySingleton
  BehaviorSubject<List<Candle>> get behaviourSubject => BehaviorSubject.seeded(<Candle>[]);
}
