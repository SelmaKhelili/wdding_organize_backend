import 'package:zefeffete/domain/usecases/wedding_owner_usecases.dart';
import 'package:zefeffete/domain/entities/weddingOwner.dart';

class WeddingOwnerController {
  final WeddingOwnerUseCases _useCases;

  WeddingOwnerController(this._useCases);

  Future<void> addWeddingOwner(WeddingOwner weddingOwner) async {
    // Coordinate with use case to add a wedding owner
    await _useCases.insertWeddingOwner(weddingOwner);
  }

  Future<WeddingOwner?> getWeddingOwnerByEmail(String email) async {
    // Coordinate with use case to fetch a wedding owner by email
    return await _useCases.getWeddingOwnerByEmail(email);
  }

  Future<void> deleteWeddingOwner(String email) async {
    // Coordinate with use case to delete a wedding owner
    await _useCases.deleteWeddingOwner(email);
  }
}
