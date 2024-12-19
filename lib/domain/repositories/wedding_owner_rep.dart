import 'package:zefeffete/data/models/wedding_owner_model.dart';

abstract class WeddingOwnerRepository {
  Future<void> insertWeddingOwner(WeddingOwnerModel weddingOwnerModel);
  Future<WeddingOwnerModel?> getWeddingOwnerByEmail(String email);
  Future<void> deleteWeddingOwner(String email);
}
