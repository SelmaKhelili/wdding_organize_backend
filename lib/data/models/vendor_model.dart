import 'package:zefeffete/domain/entities/vendor.dart';

class VendorModel extends Vendor {
  VendorModel({
    required String email,
    String? phoneNumber,
    String? city,
    String? wilaya,
    String? gender,
    String? about,
    required double priceMin,
    required double priceMax,
    required String pricingDetails,
    String? theme,
    bool activated = false,
  }) : super(
          email: email,
          phoneNumber: phoneNumber,
          city: city,
          wilaya: wilaya,
          gender: gender,
          about: about,
          priceMin: priceMin,
          priceMax: priceMax,
          pricingDetails: pricingDetails,
          theme: theme,
          activated: activated,
        );

  // Convert Model to Entity
  Vendor toEntity() {
    return Vendor(
      email: email,
      phoneNumber: phoneNumber,
      city: city,
      wilaya: wilaya,
      gender: gender,
      about: about,
      priceMin: priceMin,
      priceMax: priceMax,
      pricingDetails: pricingDetails,
      theme: theme,
      activated: activated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone_number': phoneNumber,
      'city': city,
      'wilaya': wilaya,
      'gender': gender,
      'about': about,
      'price_min': priceMin,
      'price_max': priceMax,
      'pricing_details': pricingDetails,
      'theme': theme,
      'activated': activated ? 1 : 0,
    };
  }

  static VendorModel fromMap(Map<String, dynamic> map) {
    return VendorModel(
      email: map['email'],
      phoneNumber: map['phone_number'],
      city: map['city'],
      wilaya: map['wilaya'],
      gender: map['gender'],
      about: map['about'],
      priceMin: map['price_min'],
      priceMax: map['price_max'],
      pricingDetails: map['pricing_details'],
      theme: map['theme'],
      activated: map['activated'] == 1,
    );
  }
}
