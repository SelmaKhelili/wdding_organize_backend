import 'package:zefeffete/data/models/guest_model.dart';

class GuestDataSource {
  Future<void> insertGuest(GuestModel guestModel) async {
    // Placeholder for SQL insertion logic for a guest
  }

  Future<GuestModel?> getGuestById(int guestId) async {
    // Placeholder for SQL fetch logic to get a guest by ID
    return null; // Placeholder return
  }

  Future<List<GuestModel>> getGuestsByWeddingOwnerEmail(
      String weddingOwnerEmail) async {
    // Placeholder for SQL fetch logic to get all guests by wedding owner email
    return []; // Placeholder return
  }

  Future<void> deleteGuest(int guestId) async {
    // Placeholder for SQL deletion logic for a guest by ID
  }
}
