import 'package:zefeffete/data/models/vendor_model.dart';

class Vendor {
  final String email;
  final String? phoneNumber;
  final String? city;
  final String? wilaya;
  final String? gender;
  final String? about;
  final double priceMin;
  final double priceMax;
  final String pricingDetails;
  final String? theme;
  final bool activated;

  Vendor({
    required this.email,
    this.phoneNumber,
    this.city,
    this.wilaya,
    this.gender,
    this.about,
    required this.priceMin,
    required this.priceMax,
    required this.pricingDetails,
    this.theme,
    this.activated = false,
  });

  // Convert Entity to Model
  VendorModel toModel() {
    return VendorModel(
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
}
