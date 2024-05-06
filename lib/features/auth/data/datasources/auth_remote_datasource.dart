import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../models/login_model.dart';
import '../../domain/usecases/login_usecase.dart';
import '../models/check_otp_model.dart';
import '../../domain/usecases/check_otp_usecase.dart';
import '../models/register_model.dart';
import '../../domain/usecases/register_usecase.dart';
import '../models/complete_register_model.dart';
import '../../domain/usecases/complete_register_usecase.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login({
    required LoginParams params,
  });

  Future<CheckOtpModel> checkOtp({
    required CheckOtpParams params,
  });

  Future<RegisterModel> register({
    required RegisterParams params,
  });

  Future<CompleteRegisterModel> completeRegister({
    required CompleteRegisterParams params,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<LoginModel> login({
    required LoginParams params,
  }) async {
    try {
      const String loginEndpoint = '/api/v1/login';
      final dynamic response = await dioConsumer.post(
        loginEndpoint,
        body: params.toJson(),
      );

      if (response['status'] == 200) {
        return LoginModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CheckOtpModel> checkOtp({
    required CheckOtpParams params,
  }) async {
    try {
      const String checkOtpEndpoint = '/api/v1/check-otp';
      final dynamic response = await dioConsumer.post(
        checkOtpEndpoint,
        body: params.toJson(),
      );

      if (response['status'] == 200) {
        return CheckOtpModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<RegisterModel> register({
    required RegisterParams params,
  }) async {
    try {
      const String registerEndpoint = '/api/v1/register';
      final dynamic response = await dioConsumer.post(
        registerEndpoint,
        body: params.toJson(),
      );

      if (response['status'] == 200) {
        return RegisterModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CompleteRegisterModel> completeRegister({
    required CompleteRegisterParams params,
  }) async {
    try {
      const String completeRegisterEndpoint = '/api/v1/complete-register';
      final dynamic response = await dioConsumer.post(
        completeRegisterEndpoint,
        body: params.toJson(),
      );

      if (response['status'] == 200) {
        return CompleteRegisterModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }
}
