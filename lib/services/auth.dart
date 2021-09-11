import 'package:firebase_auth/firebase_auth.dart';
import 'package:xvent/models/user.dart';

// class Auth {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future createNewUser(String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = result.user;
//       return user;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   Future loginUser(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return result.user;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   Future singOut() async {
//     try {
//       return _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }

class AuthServer {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user obj based on User
  UserDayVent? _userDayVent(User? user) {
    if (user != null) {
      return UserDayVent(uid: user.uid);
    } else {
      return null;
    }
  }

  //auth change user stream
  Stream<UserDayVent?> get userStream {
    return _auth.authStateChanges().map((User? user) => _userDayVent(user));
    // return _auth.authStateChanges().map((event) => null);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userDayVent(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sing in with email & password

  //register with email & password

  //sing out
  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
