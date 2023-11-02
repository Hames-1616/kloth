import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';


final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final authProvider = Provider((ref) => FirebaseAuth.instance);
final storageProvider = Provider((ref) => FirebaseStorage.instance);
final googleSigninprovider = Provider((ref) => GoogleSignIn());
final keyring = Provider((ref) => GlobalKey<FormState>());
final baseoptionsProvider =
    Provider((ref) => BaseOptions(connectTimeout: const Duration(seconds: 10)));
final dioProvider = Provider((ref) => Dio(ref.read(baseoptionsProvider)));