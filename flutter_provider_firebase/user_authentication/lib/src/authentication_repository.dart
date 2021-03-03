abstract class AuthModel {
  bool checkAuthenticated();

  Future<void> authenticate();
}