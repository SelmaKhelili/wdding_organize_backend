import 'package:zefeffete/data/models/venue_owner_model.dart';
import 'package:zefeffete/domain/repositories/venue_owner_rep.dart';

class VenueOwnerRepositoryImpl implements VenueOwnerRepository {
  @override
  Future<void> insertVenueOwner(VenueOwnerModel venueOwnerModel) async {
    // Placeholder for logic to insert a venue owner into the database
  }

  @override
  Future<VenueOwnerModel?> getVenueOwnerByEmail(String email) async {
    // Placeholder for logic to fetch a venue owner by email from the database
  }

  @override
  Future<void> deleteVenueOwner(String email) async {
    // Placeholder for logic to delete a venue owner from the database by email
  }
}
