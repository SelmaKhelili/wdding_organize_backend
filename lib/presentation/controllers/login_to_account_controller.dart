import 'package:flutter/material.dart';
import 'package:zefeffete/domain/usecases/login_toaccount_usecase.dart';

class LoginController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  // Now, the controller only returns the result and lets the UI handle UI-related tasks.
  Future<String> login(String email, String password) async {
    try {
      final result = await loginUseCase.execute(email, password);
      return result;  // return the result to be handled by the UI.
    } catch (e) {
      return "An unexpected error occurred."; // return error message
    }
  }
}
