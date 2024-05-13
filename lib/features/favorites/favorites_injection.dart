import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/favorites_remote_datasource.dart';
import 'data/repositories/favorites_repo_impl.dart';
import 'domain/repositories/favorites_repo.dart';
import 'domain/usecases/get_favorites_usecase.dart';
import 'presentation/controller/get_favorites/get_favorites_cubit.dart';
import 'domain/usecases/toggle_favorite_usecase.dart';
import 'presentation/controller/toggle_favorite/toggle_favorite_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initFavoritesFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<GetFavoritesCubit>(() => GetFavoritesCubit(_sl()));
  _sl.registerLazySingleton<ToggleFavoriteCubit>(() => ToggleFavoriteCubit(_sl()));

  ///-> UseCases
  _sl.registerLazySingleton<GetFavoritesUseCase>(() => GetFavoritesUseCase(repository: _sl()));
  _sl.registerLazySingleton<ToggleFavoriteUseCase>(() => ToggleFavoriteUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<FavoritesRepository>(() => FavoritesRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<FavoritesRemoteDataSource>(() => FavoritesRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get favoritesBlocs => <BlocProvider>[
  BlocProvider<GetFavoritesCubit>(
    create: (BuildContext context) => _sl<GetFavoritesCubit>(),
  ),

  BlocProvider<ToggleFavoriteCubit>(
    create: (BuildContext context) => _sl<ToggleFavoriteCubit>(),
  ),
];
