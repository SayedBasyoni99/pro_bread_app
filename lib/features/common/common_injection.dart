import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/common_remote_datasource.dart';
import 'data/repositories/common_repo_impl.dart';
import 'domain/repositories/common_repo.dart';
import 'domain/usecases/send_gift_usecase.dart';
import 'presentation/controller/send_gift/send_gift_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initCommonFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<SendGiftCubit>(() => SendGiftCubit(_sl()));

  ///-> UseCases
  _sl.registerLazySingleton<SendGiftUseCase>(() => SendGiftUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<CommonRepository>(() => CommonRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<CommonRemoteDataSource>(() => CommonRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get commonBlocs => <BlocProvider>[
  BlocProvider<SendGiftCubit>(
    create: (BuildContext context) => _sl<SendGiftCubit>(),
  ),
];
