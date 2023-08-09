import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/features/auth/repos/auth_repo.dart';

final authControllerProvider =
    Provider((ref) => AuthController(cauthRepo: ref.read(authRepoController)));

class AuthController {
  final AuthRepo authRepo;
  AuthController({required AuthRepo cauthRepo}) : authRepo = cauthRepo;

  void signInWithGoogle() {
    authRepo.signInWithGoogle();
  }
}
