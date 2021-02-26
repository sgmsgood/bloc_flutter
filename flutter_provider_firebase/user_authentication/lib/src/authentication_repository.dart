abstract class AuthenticationRepository {
  Future<bool> isAuthenticated();

  Future<void> authenticate();

  Future<String> getUserId();
}