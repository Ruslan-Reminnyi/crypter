import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypter/domain/services/remote/network_service.dart';

class NetworkServiceImpl implements NetworkService {
  final Connectivity _connectivity;

  NetworkServiceImpl(this._connectivity);

  @override
  Future<bool> get isConnected async {
    final connectivityResults = await _connectivity.checkConnectivity();
    return connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi);
  }

  @override
  Stream<bool> get listenConnectionChanges => _connectivity.onConnectivityChanged.map(
    (connectivityResult) =>
        connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi),
  );
}
