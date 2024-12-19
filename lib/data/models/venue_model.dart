import 'package:zefeffete/domain/entities/venue.dart';

class VenueModel extends Venue {
  VenueModel({
    required int id,
    required String name,
    required String city,
    required String wilaya,
    String? about,
    required double priceMin,
    required double priceMax,
    required String pricingDetails,
    required String venueOwnerEmail,
  }) : super(
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

  // Convert Model to Entity
  Venue toEntity() {
    return Venue(
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'wilaya': wilaya,
      'about': about,
      'price_min': priceMin,
      'price_max': priceMax,
      'pricing_details': pricingDetails,
      'venue_owner_email': venueOwnerEmail,
    };
  }

  static VenueModel fromMap(Map<String, dynamic> map) {
    return VenueModel(
      id: map['id'],
      name: map['name'],
      city: map['city'],
      wilaya: map['wilaya'],
      about: map['about'],
      priceMin: map['price_min'],
      priceMax: map['price_max'],
      pricingDetails: map['pricing_details'],
      venueOwnerEmail: map['venue_owner_email'],
    );
  }
}
