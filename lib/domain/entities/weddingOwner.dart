import 'package:zefeffete/data/models/wedding_owner_model.dart';

class WeddingOwner {
  final String email;
  final String? weddingDate;

  WeddingOwner({
    required this.email,
    this.weddingDate,
  });

  // Convert Entity to Model
  WeddingOwnerModel toModel() {
    return WeddingOwnerModel(
      email: email,
      weddingDate: weddingDate,
    );
  }
}
