import 'package:zefeffete/data/models/vendor_model.dart';

abstract class VendorRepository {
  Future<void> insertVendor(VendorModel vendorModel);
  Future<VendorModel?> getVendorByEmail(String email);
  Future<void> updateVendor(VendorModel vendorModel);
  Future<void> deleteVendor(String email);
}
