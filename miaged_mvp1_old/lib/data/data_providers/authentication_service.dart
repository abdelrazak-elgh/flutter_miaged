import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged_mvp1/data/models/user_model.dart';

class AuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;

  // User getUser() {
  //   return _firebaseAuth.currentUser!;
  // }

  Stream<UserModel> retrieveCurrentUser() {
    return _firebaseAuth.authStateChanges().map((User? user) {
      if (user != null) {
        return UserModel(uid: user.uid, email: user.email);
      } else {
        return const UserModel(uid: '');
      }
    });
  }

  Future<UserCredential?> signAsGuest() async {
    try {
      return await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<UserCredential?> signIn(UserModel userModel) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
      return result;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<UserCredential?> signUp(UserModel userModel) async {
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: userModel.email!, password: userModel.password!);
      return result;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }
}
