// domain/usecases/login_usecase.dart
import 'package:zefeffete/domain/repositories/account_rep.dart';

class LoginUseCase {
  final AccountRepository accountRepository;

  LoginUseCase(this.accountRepository);

  Future<String> execute(String email, String password) async {
    try {
      // Attempt to log in with the repository
      final result = await accountRepository.login(email, password);
      return result != null ? "Login successful" : "Invalid credentials";
    } catch (e) {
      return "Login failed: ${e.toString()}";
    }
  }
}
