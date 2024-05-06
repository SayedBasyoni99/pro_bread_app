import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/check_otp_response.dart';
import '../../domain/usecases/check_otp_usecase.dart';
import '../../domain/entities/register_response.dart';
import '../../domain/usecases/register_usecase.dart';
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
  Future<Either<Failure, CompleteRegisterResponse>> completeRegister({required CompleteRegisterParams params}) async {
    try {
      final CompleteRegisterResponse response = await remote.completeRegister(params: params);
        return Right<Failure, CompleteRegisterResponse>(response);
      } on AppException catch (error) {
        Log.e('[completeRegister] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, CompleteRegisterResponse>(error.toFailure());
      }
  }


}

