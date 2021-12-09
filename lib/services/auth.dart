import 'package:firebase_auth/firebase_auth.dart';
import 'package:learnfirebase/models/user.dart';
import 'package:learnfirebase/services/database.dart';

class AuthService {
  // Instance Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object baised on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return User(uid: user.uid);
    } else {
      return null;
    }
    // return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // Sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return [
        null,
        e.toString()
      ];
    }
  }

  // Sign in with email
  Future loginWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return [
        null,
        e.toString()
      ];
    }
  }

  // sign up with email
  Future registerWithEmail(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;

      // Create document
      await DatabaseServer(uid: user.uid).updateUserData('2', name, 300);

      return _userFromFirebaseUser(user);
    } catch (e) {
      return [
        null,
        e.toString()
      ];
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return [
        null,
        e.toString()
      ];
    }
  }
}
