import 'package:zefeffete/data/models/vendor_model.dart';
import 'package:zefeffete/data/models/venue_owner_model.dart';
import 'package:zefeffete/data/models/wedding_owner_model.dart';
import 'package:zefeffete/domain/repositories/account_rep.dart';
import 'package:zefeffete/presentation/controllers/vendor_controller.dart';
import 'package:zefeffete/presentation/controllers/venue_owner.dart';
import 'package:zefeffete/presentation/controllers/wedding_owner_controller.dart';
import '../entities/account.dart';

class InsertAccountUseCase {
  final AccountRepository accountRepository;
  final WeddingOwnerController weddingOwnerController;
  final VenueOwnerController venueOwnerController;
  final VendorController vendorController;

  InsertAccountUseCase({
    required this.accountRepository,
    required this.weddingOwnerController,
    required this.venueOwnerController,
    required this.vendorController,
  });

  Future<void> execute(Account account, {String? role}) async {
    // Insert account into the account table
    await accountRepository.insertAccount(account.toModel()); // Using toModel() for DB insertion

    // Insert additional data based on the role (WeddingOwner, VenueOwner, Vendor)
    if (role == 'wedding_owner') {
      // Convert the account into WeddingOwnerModel
      final weddingOwnerModel = WeddingOwnerModel(
        email: account.email,
        weddingDate: null, // Placeholder or user input value
      );
      await weddingOwnerController.addWeddingOwner(weddingOwnerModel); // Pass model to controller
    } else if (role == 'venue_owner') {
      // Convert the account into VenueOwnerModel
      final venueOwnerModel = VenueOwnerModel(
        email: account.email,
        gender: null, // Placeholder or user input value
        phoneNumber: null, // Placeholder or user input value
      );
      await venueOwnerController.addVenueOwner(venueOwnerModel); // Pass model to controller
    } else if (role == 'vendor') {
      // Convert the account into VendorModel
      final vendorModel = VendorModel(
        email: account.email,
        phoneNumber: null, // Placeholder or user input value
        city: null, // Placeholder or user input value
        wilaya: null, // Placeholder or user input value
        gender: null, // Placeholder or user input value
        about: null, // Placeholder or user input value
        priceMin: 0.0, // Placeholder or user input value
        priceMax: 0.0, // Placeholder or user input value
        pricingDetails: '', // Placeholder or user input value
      );
      await vendorController.addVendor(vendorModel); // Pass model to controller
    }
  }
}
