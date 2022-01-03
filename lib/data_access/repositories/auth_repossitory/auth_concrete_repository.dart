part of data_access;

class AuthConcreteRepository extends AuthAbstractRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
