import 'package:zefeffete/data/models/guest_model.dart';
import 'package:zefeffete/domain/repositories/guest_rep.dart';

class GuestRepositoryImpl implements GuestRepository {
  @override
  Future<void> insertGuest(GuestModel guestModel) async {
    // Placeholder for inserting a guest into the database
  }

  @override
  Future<GuestModel?> getGuestById(int guestId) async {
    // Placeholder for fetching a guest by guestId
  }

  @override
  Future<List<GuestModel>> getGuestsByWeddingOwnerEmail(
      String weddingOwnerEmail) async {
    // Placeholder
    return []; // update this
  }

  @override
  Future<void> deleteGuest(int guestId) async {
    // Placeholder for deleting a guest by guestId
  }
}
