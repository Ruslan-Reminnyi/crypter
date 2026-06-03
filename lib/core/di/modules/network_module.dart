import 'package:crypter/core/di/constants.dart';
import 'package:crypter/data/remote/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@module
abstract class AppNetworkModule {
  @lazySingleton
  Dio dio(@Named(DiConstants.apiBaseUrl) String apiBaseUrl) => Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: DiConstants.connectTimeout,
      receiveTimeout: DiConstants.receiveTimeout,
    ),
  );

  @lazySingleton
  WebSocketChannel get webSocketChannel =>
      WebSocketChannel.connect(Uri.parse(Endpoints.binanceWebSocket.home));
}
