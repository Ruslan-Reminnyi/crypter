abstract interface class AuthRepository {
  bool get isLoggedIn;

  Future<String> register(String name, String email, String password, String deviceName);
  Future<String> login(String email, String password, String deviceName);
  Future<bool> logout();
}
