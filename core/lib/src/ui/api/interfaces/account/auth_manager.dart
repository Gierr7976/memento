abstract class AuthManager {

  factory AuthManager() => throw UnimplementedError();

  Future<bool> alreadySignedIn();

  Future<bool> signIn();

  Future<bool> signOut();
}
