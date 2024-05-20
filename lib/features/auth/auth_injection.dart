import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/forget_password_usecase.dart';
import 'domain/usecases/get_user_type_usecase.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/remove_access_token_usecase.dart';
import 'domain/usecases/save_access_token_usecase.dart';
import 'domain/usecases/save_user_type_usecase.dart';
import 'domain/usecases/send_otp_usecase.dart';
import 'domain/usecases/update_password_usecase.dart';
import 'presentation/controller/auto_login/auto_login_cubit.dart';
import 'presentation/controller/forget_password/forget_password_cubit.dart';
import 'presentation/controller/login/login_cubit.dart';
import 'domain/usecases/check_otp_usecase.dart';
import 'presentation/controller/check_otp/check_otp_cubit.dart';
import 'domain/usecases/register_usecase.dart';
import 'presentation/controller/register/register_cubit.dart';
import 'domain/usecases/complete_register_usecase.dart';
import 'presentation/controller/complete_register/complete_register_cubit.dart';
import 'presentation/controller/send_otp/send_otp_cubit.dart';
import 'presentation/controller/update_password/update_password_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initAuthFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<ForgetPasswordCubit>(() => ForgetPasswordCubit(_sl()));
  _sl.registerLazySingleton<UpdatePasswordCubit>(() => UpdatePasswordCubit(_sl()));
  _sl.registerLazySingleton<SendOtpCubit>(() => SendOtpCubit(_sl()));
  _sl.registerLazySingleton<LoginCubit>(() => LoginCubit(_sl()));
  _sl.registerLazySingleton<CheckOtpCubit>(() => CheckOtpCubit(_sl()));
  _sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(_sl()));
  _sl.registerLazySingleton<CompleteRegisterCubit>(() => CompleteRegisterCubit(_sl()));
  _sl.registerLazySingleton<AutoLoginCubit>(() => AutoLoginCubit(
    getUserTypeUseCase: _sl(),
    saveUserTypeUseCase: _sl(),
    saveAccessTokenUseCase: _sl(),
    removeAccessTokenUseCase: _sl(),
  ));

  ///-> UseCases
  _sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: _sl()));
  _sl.registerLazySingleton<ForgetPasswordUseCase>(() => ForgetPasswordUseCase(repository: _sl()));
  _sl.registerLazySingleton<SendOtpUseCase>(() => SendOtpUseCase(repository: _sl()));
  _sl.registerLazySingleton<UpdatePasswordUseCase>(() => UpdatePasswordUseCase(repository: _sl()));
  _sl.registerLazySingleton<CheckOtpUseCase>(() => CheckOtpUseCase(repository: _sl()));
  _sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(repository: _sl()));
  _sl.registerLazySingleton<CompleteRegisterUseCase>(() => CompleteRegisterUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetUserTypeUseCase>(() => GetUserTypeUseCase(repository: _sl()));
  _sl.registerLazySingleton<SaveUserTypeUseCase>(() => SaveUserTypeUseCase(repository: _sl()));
  _sl.registerLazySingleton<SaveAccessTokenUseCase>(() => SaveAccessTokenUseCase(repository: _sl()));
  _sl.registerLazySingleton<RemoveAccessTokenUseCase>(() => RemoveAccessTokenUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get authBlocs => <BlocProvider>[
  BlocProvider<LoginCubit>(
    create: (BuildContext context) => _sl<LoginCubit>(),
  ),

  BlocProvider<CheckOtpCubit>(
    create: (BuildContext context) => _sl<CheckOtpCubit>(),
  ),

  BlocProvider<ForgetPasswordCubit>(
    create: (BuildContext context) => _sl<ForgetPasswordCubit>(),
  ),

  BlocProvider<SendOtpCubit>(
    create: (BuildContext context) => _sl<SendOtpCubit>(),
  ),

  BlocProvider<UpdatePasswordCubit>(
    create: (BuildContext context) => _sl<UpdatePasswordCubit>(),
  ),

  BlocProvider<RegisterCubit>(
    create: (BuildContext context) => _sl<RegisterCubit>(),
  ),

  BlocProvider<CompleteRegisterCubit>(
    create: (BuildContext context) => _sl<CompleteRegisterCubit>(),
  ),

  BlocProvider<AutoLoginCubit>(
    create: (BuildContext context) => _sl<AutoLoginCubit>(),
  ),
];
