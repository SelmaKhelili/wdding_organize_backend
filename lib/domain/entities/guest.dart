import 'package:zefeffete/data/models/guest_model.dart';

class Guest {
  final int guestId;
  final String weddingOwnerEmail;
  final String? name;
  final String? gender;
  final String? side;
  final int numWomen;
  final int numMen;
  final int numKids;

  Guest({
    required this.guestId,
    required this.weddingOwnerEmail,
    this.name,
    this.gender,
    this.side,
    this.numWomen = 0,
    this.numMen = 0,
    this.numKids = 0,
  });

  // Convert Entity to Model
  GuestModel toModel() {
    return GuestModel(
      guestId: guestId,
      weddingOwnerEmail: weddingOwnerEmail,
      name: name,
      gender: gender,
      side: side,
      numWomen: numWomen,
      numMen: numMen,
      numKids: numKids,
    );
  }
}
