abstract class AuthenticationRepository {
  Future<bool> checkAuthenticated();

  Future<void> authenticate();
}