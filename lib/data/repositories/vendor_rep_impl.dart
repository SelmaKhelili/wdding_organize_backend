import 'package:zefeffete/data/models/vendor_model.dart';
import 'package:zefeffete/domain/repositories/vendor_rep.dart';

class VendorRepositoryImpl implements VendorRepository {
  @override
  Future<void> insertVendor(VendorModel vendorModel) async {
    // Placeholder for logic to insert a vendor into the database
  }

  @override
  Future<VendorModel?> getVendorByEmail(String email) async {
    // Placeholder for logic to fetch a vendor by email
  }

  @override
  Future<void> updateVendor(VendorModel vendorModel) async {
    // Placeholder for logic to update vendor details in the database
  }

  @override
  Future<void> deleteVendor(String email) async {
    // Placeholder for logic to delete a vendor from the database by email
  }
}
