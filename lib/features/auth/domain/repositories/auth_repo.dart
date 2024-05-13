import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/forget_password_response.dart';
import '../../domain/usecases/forget_password_usecase.dart';
import '../../domain/entities/send_otp_response.dart';
import '../../domain/usecases/send_otp_usecase.dart';
import '../../domain/entities/check_otp_response.dart';
import '../../domain/usecases/check_otp_usecase.dart';
import '../../domain/entities/register_response.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/entities/update_password_response.dart';
import '../../domain/usecases/update_password_usecase.dart';
import '../../domain/entities/complete_register_response.dart';
import '../../domain/usecases/complete_register_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login({
    required LoginParams params,
  });


  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({
    required ForgetPasswordParams params,
  });


  Future<Either<Failure, SendOtpResponse>> sendOtp({
    required SendOtpParams params,
  });


  Future<Either<Failure, CheckOtpResponse>> checkOtp({
    required CheckOtpParams params,
  });


  Future<Either<Failure, RegisterResponse>> register({
    required RegisterParams params,
  });


  Future<Either<Failure, UpdatePasswordResponse>> updatePassword({
    required UpdatePasswordParams params,
  });


  Future<Either<Failure, CompleteRegisterResponse>> completeRegister({
    required CompleteRegisterParams params,
  });


}
