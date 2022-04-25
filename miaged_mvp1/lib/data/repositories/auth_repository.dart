import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/user.dart';

class AuthRepository {
  final _firebaseAuth = firebase_auth.FirebaseAuth.instance;
  var currentUser = AppUser.empty;

  Stream<AppUser> get user {
    return _firebaseAuth.authStateChanges().map(
      (firebaseUser) {
        final user = firebaseUser == null ? AppUser.empty : firebaseUser.toUser;
        currentUser = user;
        return user;
      },
    );
  }

  // AppUser? _userFromFirebaseUser(User? user) {
  //   return user != null ? AppUser(uid: user.uid) : null;
  // }

  // // récupérer l'utilisateur courant et ecouter quand l'user se connecte ou deconnecte
  // Stream<AppUser?> get user {
  //   return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  // }

  // Stream<User?> retrieveCurrentUser() {
  //   return _firebaseAuth.authStateChanges().map((User? user) {
  //     if (user != null) {
  //       return user;
  //     } else {
  //       return null;
  //     }
  //   });
  // }

  Future<User?> signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          if (kDebugMode) {
            print("Anonymous auth hasn't been enabled for this project.");
          }
          break;
        default:
          if (kDebugMode) {
            print("Unkown error.");
          }
      }
      return null;
    }
  }

  Future<void> signInWithCredentials(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  User getUser() {
    return _firebaseAuth.currentUser!;
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }
}

extension on firebase_auth.User {
  AppUser get toUser {
    return AppUser(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
