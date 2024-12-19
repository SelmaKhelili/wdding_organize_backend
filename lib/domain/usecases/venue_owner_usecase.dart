import 'package:zefeffete/domain/entities/venueOwner.dart';
import 'package:zefeffete/domain/repositories/venue_owner_rep.dart';

class VenueOwnerUseCases {
  final VenueOwnerRepository _repository;

  VenueOwnerUseCases(this._repository);

  Future<void> insertVenueOwner(VenueOwner venueOwner) async {
    // Transform entity to model and pass to repository
    await _repository.insertVenueOwner(venueOwner.toModel());
  }

  Future<VenueOwner?> getVenueOwnerByEmail(String email) async {
    // Fetch model from repository, transform to entity, and return
    final model = await _repository.getVenueOwnerByEmail(email);
    return model?.toEntity();
  }

  Future<void> deleteVenueOwner(String email) async {
    // Call repository to delete
    await _repository.deleteVenueOwner(email);
  }
}
