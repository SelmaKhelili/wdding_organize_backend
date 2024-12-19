import 'package:zefeffete/data/models/account_model.dart';

abstract class AccountRepository {
  Future<void> insertAccount(AccountModel accountModel);
  Future<AccountModel?> getAccountByEmail(String email);
  Future<void> deleteAccount(String email);
  Future<AccountModel?> login(String email, String password);
}
