import 'package:zefeffete/data/models/venue_model.dart';

class Venue {
  final int id;
  final String name;
  final String city;
  final String wilaya;
  final String? about;
  final double priceMin;
  final double priceMax;
  final String pricingDetails;
  final String venueOwnerEmail;

  Venue({
    required this.id,
    required this.name,
    required this.city,
    required this.wilaya,
    this.about,
    required this.priceMin,
    required this.priceMax,
    required this.pricingDetails,
    required this.venueOwnerEmail,
  });

  // Convert Entity to Model
  VenueModel toModel() {
    return VenueModel(
      id: id,
      name: name,
      city: city,
      wilaya: wilaya,
      about: about,
      priceMin: priceMin,
      priceMax: priceMax,
      pricingDetails: pricingDetails,
      venueOwnerEmail: venueOwnerEmail,
    );
  }
}
