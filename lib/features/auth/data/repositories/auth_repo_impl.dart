import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../../../injection_container.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/forget_password_response.dart';
import '../../domain/usecases/forget_password_usecase.dart';
import '../../domain/entities/send_otp_response.dart';
import '../../domain/usecases/save_access_token_usecase.dart';
import '../../domain/usecases/save_user_type_usecase.dart';
import '../../domain/usecases/send_otp_usecase.dart';
import '../../domain/entities/check_otp_response.dart';
import '../../domain/usecases/check_otp_usecase.dart';
import '../../domain/entities/register_response.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/entities/update_password_response.dart';
import '../../domain/usecases/update_password_usecase.dart';
import '../../domain/entities/complete_register_response.dart';
import '../../domain/usecases/complete_register_usecase.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({
    required this.remote,
  });

  /// Impl
  @override
  Future<Either<Failure, LoginResponse>> login({required LoginParams params}) async {
    try {
      final LoginResponse response = await remote.login(params: params);
      return Right<Failure, LoginResponse>(response);
    } on AppException catch (error) {
      Log.e('[login] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, LoginResponse>(error.toFailure());
    }
  }


  @override
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({required ForgetPasswordParams params}) async {
    try {
      final ForgetPasswordResponse response = await remote.forgetPassword(params: params);
      return Right<Failure, ForgetPasswordResponse>(response);
    } on AppException catch (error) {
      Log.e('[forgetPassword] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, ForgetPasswordResponse>(error.toFailure());
    }
  }


  @override
  Future<Either<Failure, SendOtpResponse>> sendOtp({required SendOtpParams params}) async {
    try {
      final SendOtpResponse response = await remote.sendOtp(params: params);
      return Right<Failure, SendOtpResponse>(response);
    } on AppException catch (error) {
      Log.e('[sendOtp] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, SendOtpResponse>(error.toFailure());
    }
  }


  @override
  Future<Either<Failure, CheckOtpResponse>> checkOtp({required CheckOtpParams params}) async {
    try {
      final CheckOtpResponse response = await remote.checkOtp(params: params);
      return Right<Failure, CheckOtpResponse>(response);
    } on AppException catch (error) {
      Log.e('[checkOtp] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, CheckOtpResponse>(error.toFailure());
    }
  }


  @override
  Future<Either<Failure, RegisterResponse>> register({required RegisterParams params}) async {
    try {
      final RegisterResponse response = await remote.register(params: params);
      return Right<Failure, RegisterResponse>(response);
    } on AppException catch (error) {
      Log.e('[register] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, RegisterResponse>(error.toFailure());
    }
  }


  @override
  Future<Either<Failure, UpdatePasswordResponse>> updatePassword({required UpdatePasswordParams params}) async {
    try {
      final UpdatePasswordResponse response = await remote.updatePassword(params: params);
      return Right<Failure, UpdatePasswordResponse>(response);
    } on AppException catch (error) {
      Log.e('[updatePassword] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, UpdatePasswordResponse>(error.toFailure());
    }
  }


  @override
  Future<Either<Failure, CompleteRegisterResponse>> completeRegister({required CompleteRegisterParams params}) async {
    try {
      final CompleteRegisterResponse response = await remote.completeRegister(params: params);
      return Right<Failure, CompleteRegisterResponse>(response);
    } on AppException catch (error) {
      Log.e('[completeRegister] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, CompleteRegisterResponse>(error.toFailure());
    }
  }


  @override
  Future<Either<Failure, UserType>> getUserType({required NoParams params}) async {
    try {
      UserType userType = sharedPreferencesService.getUserType();
      return Right<Failure, UserType>(userType);
    } on AppException catch (error) {
      Log.e('[getUserType] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, UserType>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveUserType({required SaveUserTypeParams params}) async {
    try {
      final result = await sharedPreferencesService.saveUserType(params.type);
      return Right<Failure, void>(result);
    } on AppException catch (error) {
      Log.e('[saveUserType] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, void>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveAccessToken({required SaveAccessTokenParams params}) async {
    try {
      await secureStorageService.saveAccessToken(params.token);
      return const Right<Failure, bool>(true);
    } on AppException catch (error) {
      Log.e('[saveAccessToken] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, bool>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> removeAccessToken({required NoParams params}) async {
    try {
      await secureStorageService.saveAccessToken('');
      return const Right<Failure, bool>(true);
    } on AppException catch (error) {
      Log.e('[removeAccessToken] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, bool>(error.toFailure());
    }
  }


}

