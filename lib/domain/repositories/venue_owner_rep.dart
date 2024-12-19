import 'package:zefeffete/data/models/venue_owner_model.dart';

abstract class VenueOwnerRepository {
  Future<void> insertVenueOwner(VenueOwnerModel venueOwnerModel);
  Future<VenueOwnerModel?> getVenueOwnerByEmail(String email);
  Future<void> deleteVenueOwner(String email);
}
