import 'package:zefeffete/domain/entities/venueOwner.dart';
import 'package:zefeffete/domain/usecases/venue_owner_usecase.dart';

class VenueOwnerController {
  final VenueOwnerUseCases _useCases;

  VenueOwnerController(this._useCases);

  Future<void> addVenueOwner(VenueOwner venueOwner) async {
    // Coordinate with use case to add a venue owner
    await _useCases.insertVenueOwner(venueOwner);
  }

  Future<VenueOwner?> getVenueOwnerByEmail(String email) async {
    // Coordinate with use case to fetch a venue owner by email
    return await _useCases.getVenueOwnerByEmail(email);
  }

  Future<void> deleteVenueOwner(String email) async {
    // Coordinate with use case to delete a venue owner
    await _useCases.deleteVenueOwner(email);
  }
}
