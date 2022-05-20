import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged_mvp1/data/data_providers/authentication_service.dart';
import 'package:miaged_mvp1/data/data_providers/database_service.dart';
import 'package:miaged_mvp1/data/models/user_model.dart';

class AuthenticationRepository {
  AuthenticationService authenticationService = AuthenticationService();
  DatabaseService databaseService = DatabaseService();

  Stream<UserModel> getCurrentUser() {
    return authenticationService.retrieveCurrentUser();
  }

  Future<UserCredential?> signAsGuest() {
    try {
      return authenticationService.signAsGuest();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<UserCredential?> signUp(UserModel user) {
    try {
      return authenticationService.signUp(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<UserCredential?> signIn(UserModel user) {
    try {
      return authenticationService.signIn(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<void> signOut() {
    return authenticationService.signOut();
  }

  Future<String?> retrieveUserName(UserModel user) {
    return databaseService.retrieveUserName(user);
  }

  bool isSignedIn() {
    return authenticationService.isSignedIn();
  }
}
