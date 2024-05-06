import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/address_remote_datasource.dart';
import 'data/repositories/address_repo_impl.dart';
import 'domain/repositories/address_repo.dart';
import 'domain/usecases/edit_address_usecase.dart';
import 'presentation/controller/edit_address/edit_address_cubit.dart';
import 'domain/usecases/get_address_usecase.dart';
import 'presentation/controller/get_address/get_address_cubit.dart';
import 'domain/usecases/add_address_usecase.dart';
import 'presentation/controller/add_address/add_address_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initAddressFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<EditAddressCubit>(() => EditAddressCubit(_sl()));
  _sl.registerLazySingleton<GetAddressCubit>(() => GetAddressCubit(_sl()));
  _sl.registerLazySingleton<AddAddressCubit>(() => AddAddressCubit(_sl()));

  ///-> UseCases
  _sl.registerLazySingleton<EditAddressUseCase>(() => EditAddressUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetAddressUseCase>(() => GetAddressUseCase(repository: _sl()));
  _sl.registerLazySingleton<AddAddressUseCase>(() => AddAddressUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<AddressRemoteDataSource>(() => AddressRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get addressBlocs => <BlocProvider>[
  BlocProvider<EditAddressCubit>(
    create: (BuildContext context) => _sl<EditAddressCubit>(),
  ),

  BlocProvider<GetAddressCubit>(
    create: (BuildContext context) => _sl<GetAddressCubit>(),
  ),

  BlocProvider<AddAddressCubit>(
    create: (BuildContext context) => _sl<AddAddressCubit>(),
  ),
];
