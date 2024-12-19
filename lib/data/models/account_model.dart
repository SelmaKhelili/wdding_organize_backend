import 'package:zefeffete/domain/entities/account.dart';

class AccountModel extends Account {
  AccountModel({
    required String email,
    required String password,
    required String username,
    String? profilePicture,
    required String role,
  }) : super(
          email: email,
          password: password,
          username: username,
          profilePicture: profilePicture,
          role: role,
        );

  // Convert Model to Entity
  Account toEntity() {
    return Account(
      email: email,
      password: password,
      username: username,
      profilePicture: profilePicture,
      role: role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'profile_picture': profilePicture,
      'role': role,
    };
  }

  static AccountModel fromMap(Map<String, dynamic> map) {
    return AccountModel(
      email: map['email'],
      password: map['password'],
      username: map['username'],
      profilePicture: map['profile_picture'],
      role: map['role'],
    );
  }
}
