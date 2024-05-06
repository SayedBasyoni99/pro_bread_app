import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/login_usecase.dart';
import 'presentation/controller/login/login_cubit.dart';
import 'domain/usecases/check_otp_usecase.dart';
import 'presentation/controller/check_otp/check_otp_cubit.dart';
import 'domain/usecases/register_usecase.dart';
import 'presentation/controller/register/register_cubit.dart';
import 'domain/usecases/complete_register_usecase.dart';
import 'presentation/controller/complete_register/complete_register_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initAuthFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<LoginCubit>(() => LoginCubit(_sl()));
  _sl.registerLazySingleton<CheckOtpCubit>(() => CheckOtpCubit(_sl()));
  _sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(_sl()));
  _sl.registerLazySingleton<CompleteRegisterCubit>(() => CompleteRegisterCubit(_sl()));

  ///-> UseCases
  _sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: _sl()));
  _sl.registerLazySingleton<CheckOtpUseCase>(() => CheckOtpUseCase(repository: _sl()));
  _sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(repository: _sl()));
  _sl.registerLazySingleton<CompleteRegisterUseCase>(() => CompleteRegisterUseCase(repository: _sl()));

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

  BlocProvider<RegisterCubit>(
    create: (BuildContext context) => _sl<RegisterCubit>(),
  ),

  BlocProvider<CompleteRegisterCubit>(
    create: (BuildContext context) => _sl<CompleteRegisterCubit>(),
  ),
];
