import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  // ignore: deprecated_member_use
  Stream<String> get onAuthStateChanged => _firebaseAuth.authStateChanges().map(
        (User user) => user?.uid,
      );

  Future<String> getCurrentUID() async {
    return (_firebaseAuth.currentUser).uid;
  }

  Future<String> signUp(String email, String password, String placa,
      String name, String apell, String vehi, String phone) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await updateUserName(name, authResult.user);

      firestoreInstance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({
        "name": name,
        "apellido": apell,
        "celular": phone,
        "email": email,
        "vehiculo": vehi,
        "placa": placa,
        "UserID": FirebaseAuth.instance.currentUser.uid
      }).then((_) {
        print("Success!");
      });
      return "Signed UP";
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message);
    }
  }

  Future getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  Future updateUserName(String name, User currentUser) async {
    await currentUser.updateProfile(displayName: name);
    await currentUser.reload();
  }

  // Email & Password Sign In

  Future signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message.toString());
    }
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }
}
