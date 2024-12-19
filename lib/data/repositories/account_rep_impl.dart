import 'package:zefeffete/data/datasources/account_ds.dart';
import 'package:zefeffete/data/models/account_model.dart';
import 'package:zefeffete/domain/repositories/account_rep.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountDataSource dataSource;

  // Constructor that requires the AccountDataSource
  AccountRepositoryImpl(this.dataSource);

  @override
  Future<void> insertAccount(AccountModel accountModel) async {
    // Delegate to the AccountDataSource to insert the account
    await dataSource.insertAccount(accountModel);
  }

  @override
  Future<AccountModel?> getAccountByEmail(String email) async {
    // Delegate to the AccountDataSource to get an account by email
    return await dataSource.getAccountByEmail(email);
  }

  @override
  Future<void> deleteAccount(String email) async {
    // Delegate to the AccountDataSource to delete an account by email
    await dataSource.deleteAccount(email);
  }

  @override
  Future<AccountModel?> login(String email, String password) async {
    // Get the account by email
    final account = await dataSource.getAccountByEmail(email);
    if (account != null && account.password == password) {
      return account; // If password matches, return the account
    }
    return null; // Return null if no matching account is found or passwords don't match
  }
}
