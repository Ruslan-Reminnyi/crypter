abstract interface class AuthRepository {
  bool get isLoggedIn;

  Future<void> register(String name, String email, String password, String deviceName);
  Future<void> login(String email, String password, String deviceName);
  Future<void> logout();
}
