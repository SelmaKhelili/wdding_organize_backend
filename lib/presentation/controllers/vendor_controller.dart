import 'package:zefeffete/domain/usecases/vendor_usecases.dart';
import 'package:zefeffete/domain/entities/vendor.dart';

class VendorController {
  final VendorUseCases _useCases;

  VendorController(this._useCases);

  Future<void> addVendor(Vendor vendor) async {
    // Coordinate with use case to add a vendor
    await _useCases.insertVendor(vendor);
  }

  Future<Vendor?> getVendorByEmail(String email) async {
    // Coordinate with use case to fetch a vendor by email
    return await _useCases.getVendorByEmail(email);
  }

  Future<void> deleteVendor(String email) async {
    // Coordinate with use case to delete a vendor
    await _useCases.deleteVendor(email);
  }
}
