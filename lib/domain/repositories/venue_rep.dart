import 'package:zefeffete/data/models/venue_model.dart';

abstract class VenueRepository {
  Future<void> insertVenue(VenueModel venueModel);
  Future<VenueModel?> getVenueById(int venueId);
  Future<List<VenueModel>> getVenuesByOwnerEmail(String venueOwnerEmail);
  Future<void> updateVenue(VenueModel venueModel);
  Future<void> deleteVenue(int venueId);
}
