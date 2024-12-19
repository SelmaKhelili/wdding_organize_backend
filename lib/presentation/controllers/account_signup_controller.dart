import 'package:zefeffete/domain/entities/account.dart';
import 'package:zefeffete/domain/usecases/insert_account_usecase.dart';

class SignupController {
  final InsertAccountUseCase insertAccountUseCase;

  SignupController(this.insertAccountUseCase);

  Future<String> signup({
    required String email,
    required String password,
    required String username,
    String? profilePicture,
    required String role,
  }) async {
    try {
      final account = Account(
        email: email,
        password: password,
        username: username,
        profilePicture: profilePicture,
        role: role,
      );

      await insertAccountUseCase.execute(account);
      return "Signup successful";
    } catch (e) {
      return "Signup failed: ${e.toString()}";
    }
  }
}
