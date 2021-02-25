abstract class AuthenticationRepository {
  Future<bool> _isAuthenticated();

  Future<void> _authenticate();

  Future<String> _getUserId();
}