import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/showSnackBar.dart';
import 'package:kloth/features/auth/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(cauthRepo: ref.watch(authRepoController)));

class AuthController extends StateNotifier<bool> {
  final AuthRepo authRepo;
  AuthController({required AuthRepo cauthRepo})
      : authRepo = cauthRepo,
        super(false);

  void signInWithGoogle() {
    authRepo.signInWithGoogle();
  }

  Future<bool> createAccount(
      String name, String email, String password, BuildContext context) async {
    state = true;
    final s = await authRepo.createAccount(name, email, password);
    state = false;
    return s.fold((l) {
      ShowSnackBar(context, l.message);
      return false;
    }, (r) async {
      final remember = await SharedPreferences.getInstance();
      await remember.setString("token", r);
      return true;
    });
  }

  Future<bool> loginAccount(
      String email, String password, BuildContext context) async {
    state = true;
    final s = await authRepo.loginAccount(email, password);
    state = false;
    return s.fold((l) {
      ShowSnackBar(context, l.message);
      return false;
    }, (r) {
      return true;
    });
  }
}
