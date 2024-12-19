import 'package:zefeffete/data/models/guest_model.dart';

abstract class GuestRepository {
  Future<void> insertGuest(GuestModel guestModel);
  Future<GuestModel?> getGuestById(int guestId);
  Future<List<GuestModel>> getGuestsByWeddingOwnerEmail(
      String weddingOwnerEmail);
  Future<void> deleteGuest(int guestId);
}
