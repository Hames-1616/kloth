import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kloth/core/failure.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/core/type_def.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      print(userCredential.user?.email);
    } catch (E) {
      print(E);
    }
  }

  FutureEither<String> createAccount(
      String name, String email, String password) async {
    try {
      var response = await dio.post(
          "http://192.168.29.94:3000/users/createuser",
          data: {"name": name, "email": email, "password": password});
      String token = response.data['access_token'];
      return right(token);
    } on DioException catch (e) {
      return left(Failure(e.response?.data["message"]));
      //
    }
  }

  FutureEither<String> loginAccount(String email, String password) async {
    try {
      final remember = await SharedPreferences.getInstance();
      dio.options.headers['jwt'] = remember.getString("token");
      await dio.post("http://192.168.29.94:3000/users/login",
          data: {"email": email, "password": password});
      return right("success");
    } on DioException catch (e) {
      return left(Failure(e.response?.data["message"]));
      //
    }
  }
}
