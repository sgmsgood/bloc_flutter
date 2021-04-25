class OauthInterface {
  Future<void> oauth() async{}

  Future<void> signout() async {}

  Future<String> _googleAuth() async {}

  Future<String> _appleAuth() async {}

  Future<void> _ssoSignOut() async {}
}