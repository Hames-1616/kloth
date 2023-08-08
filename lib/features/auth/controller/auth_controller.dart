import 'package:kloth/features/auth/repos/auth_repo.dart';

class AuthController {
  final AuthRepo authRepo;
  AuthController({required AuthRepo cauthRepo}) : authRepo = cauthRepo;

  void signInWithGoogle() {
    authRepo.signInWithGoogle();
  }
}
