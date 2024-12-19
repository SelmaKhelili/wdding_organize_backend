import 'package:zefeffete/domain/entities/weddingOwner.dart';

class WeddingOwnerModel extends WeddingOwner {
  WeddingOwnerModel({
    required String email,
    String? weddingDate,
  }) : super(
          email: email,
          weddingDate: weddingDate,
        );

  // Convert Model to Entity
  WeddingOwner toEntity() {
    return WeddingOwner(
      email: email,
      weddingDate: weddingDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'wedding_date': weddingDate,
    };
  }

  static WeddingOwnerModel fromMap(Map<String, dynamic> map) {
    return WeddingOwnerModel(
      email: map['email'],
      weddingDate: map['wedding_date'],
    );
  }
}
