import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kloth/core/failure.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/core/type_def.dart';

final authRepoController = Provider((ref) {
  return AuthRepo(
      cfirestore: ref.read(firestoreProvider),
      cauth: ref.read(authProvider),
      cgoogleSignIn: ref.read(googleSigninprovider),
      cdio: ref.read(dioProvider));
});

class AuthRepo {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  final Dio dio;

  AuthRepo(
      {required FirebaseFirestore cfirestore,
      required FirebaseAuth cauth,
      required GoogleSignIn cgoogleSignIn,
      required Dio cdio})
      : firestore = cfirestore,
        auth = cauth,
        googleSignIn = cgoogleSignIn,
        dio = cdio;

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final credential = GoogleAuthProvider.credential(
          accessToken: (await googleUser?.authentication)?.accessToken,
          idToken: (await googleUser?.authentication)?.idToken);
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      print(userCredential);
    } catch (E) {}
  }

  FutureEither<String> createAccount(
      String name, String email, String password) async {
    try {
      await dio.post("https://zealous-lamb-garment.cyclic.app/users/createuser",
          data: {"name": name, "email": email, "password": password});
      return right("success");
    } on DioException catch (e) {
      return left(Failure(e.response?.data["message"]));
      //
    }
  }

  FutureEither<String> loginAccount(String email, String password) async {
    try {
      // final remember = await SharedPreferences.getInstance();
      // dio.options.headers['jwt'] = remember.getString("token");
      var response = await dio.post(
          "https://zealous-lamb-garment.cyclic.app/users/login",
          data: {"email": email, "password": password});
      String token = response.data['access_token'];
      return right(token);
    } on DioException catch (e) {
      return left(Failure(e.response?.data["message"]));
      //
    }
  }
}
