import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  AuthRepo(
      {required FirebaseFirestore cfirestore,
      required FirebaseAuth cauth,
      required GoogleSignIn cgoogleSignIn})
      : firestore = cfirestore,
        auth = cauth,
        googleSignIn = cgoogleSignIn;

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final credential = GoogleAuthProvider.credential(
          accessToken: (await googleUser?.authentication)?.accessToken,
          idToken: (await googleUser?.authentication)?.idToken);
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      print(userCredential.user?.email);
    } catch (E) {
      print(E);
    }
  }
}
