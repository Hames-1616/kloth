import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final authProvider = Provider((ref) => FirebaseAuth.instance);
final storageProvider = Provider((ref) => FirebaseStorage.instance);
final googleSigninprovider = Provider((ref) => GoogleSignIn());
final baseoptionsProvider =
    Provider((ref) => BaseOptions(connectTimeout: const Duration(seconds: 10)));
final dioProvider = Provider((ref) => Dio(ref.read(baseoptionsProvider)));
final stringToken = FutureProvider((ref) async {
  final token = await SharedPreferences.getInstance();
  return token.getString("token");
});

final loginscreen = StateProvider<bool>((ref) => false);
