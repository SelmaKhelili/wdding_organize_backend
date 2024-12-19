import 'package:zefeffete/domain/entities/weddingOwner.dart';
import 'package:zefeffete/domain/repositories/wedding_owner_rep.dart';

class WeddingOwnerUseCases {
  final WeddingOwnerRepository _repository;

  WeddingOwnerUseCases(this._repository);

  Future<void> insertWeddingOwner(WeddingOwner weddingOwner) async {
    // Transform entity to model and pass to repository
    await _repository.insertWeddingOwner(weddingOwner.toModel());
  }

  Future<WeddingOwner?> getWeddingOwnerByEmail(String email) async {
    // Fetch model from repository, transform to entity, and return
    final model = await _repository.getWeddingOwnerByEmail(email);
    return model?.toEntity();
  }

  Future<void> deleteWeddingOwner(String email) async {
    // Call repository to delete
    await _repository.deleteWeddingOwner(email);
  }
}
