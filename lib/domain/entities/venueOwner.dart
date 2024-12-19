import 'package:zefeffete/data/models/venue_owner_model.dart';

class VenueOwner {
  final String email;
  final String? gender;
  final String? phoneNumber;

  VenueOwner({
    required this.email,
    this.gender,
    this.phoneNumber,
  });

  // Convert Entity to Model
  VenueOwnerModel toModel() {
    return VenueOwnerModel(
      email: email,
      gender: gender,
      phoneNumber: phoneNumber,
    );
  }
}
