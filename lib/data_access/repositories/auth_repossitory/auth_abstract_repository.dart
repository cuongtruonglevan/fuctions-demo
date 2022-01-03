part of data_access;

abstract class AuthAbstractRepository {
  AuthAbstractRepository();
  factory AuthAbstractRepository.createConcrete() => AuthConcreteRepository();
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
}
