import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../../../../core/api/dio_consumer.dart';
import '../models/edit_address_model.dart';
import '../../domain/usecases/edit_address_usecase.dart';
import '../models/get_address_model.dart';
import '../../domain/usecases/get_address_usecase.dart';
import '../models/add_address_model.dart';
import '../../domain/usecases/add_address_usecase.dart';

abstract class AddressRemoteDataSource {
  Future<EditAddressModel> editAddress({
    required EditAddressParams params,
  });

  Future<GetAddressModel> getAddress({
    required GetAddressParams params,
  });

  Future<AddAddressModel> addAddress({
    required AddAddressParams params,
  });

}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {

  @override
  Future<EditAddressModel> editAddress({
    required EditAddressParams params,
  }) async {
    try {
      const String editAddressEndpoint = '/api/v1/edit-address';
      final dynamic response = await dioConsumer.post(
        editAddressEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return EditAddressModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<GetAddressModel> getAddress({
    required GetAddressParams params,
  }) async {
    try {
      const String getAddressEndpoint = '/api/v1/get-address';
      final dynamic response = await dioConsumer.get(
        getAddressEndpoint,
      );

      if(response['success'] == true){
        return GetAddressModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<AddAddressModel> addAddress({
    required AddAddressParams params,
  }) async {
    try {
      const String addAddressEndpoint = '/api/v1/add-address';
      final dynamic response = await dioConsumer.post(
        addAddressEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return AddAddressModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

}
