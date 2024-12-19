import 'package:zefeffete/data/datasources/wedding_owner_ds.dart';
import 'package:zefeffete/data/models/wedding_owner_model.dart';
import 'package:zefeffete/domain/repositories/wedding_owner_rep.dart';

class WeddingOwnerRepositoryImpl implements WeddingOwnerRepository {
  final WeddingOwnerDataSource dataSource;

  WeddingOwnerRepositoryImpl(this.dataSource);
  
  @override
  Future<void> insertWeddingOwner(WeddingOwnerModel weddingownermodel) async {
    // Insert into WeddingOwner table
    await dataSource.insertWeddingOwner(weddingownermodel);
  }
  
  @override
  Future<void> deleteWeddingOwner(String email) async{
    
  }
  @override
  Future<WeddingOwnerModel?> getWeddingOwnerByEmail(String email) async{
   
  }

}
