abstract class NetworkService {
  Future<bool> get isConnected;
  Stream<bool> get listenConnectionChanges;
}
