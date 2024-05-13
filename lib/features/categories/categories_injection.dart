import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/categories_remote_datasource.dart';
import 'data/repositories/categories_repo_impl.dart';
import 'domain/repositories/categories_repo.dart';
import 'domain/usecases/get_dish_usecase.dart';
import 'presentation/controller/get_dish/get_dish_cubit.dart';
import 'domain/usecases/get_dishes_usecase.dart';
import 'presentation/controller/get_dishes/get_dishes_cubit.dart';
import 'domain/usecases/get_category_usecase.dart';
import 'presentation/controller/get_category/get_category_cubit.dart';
import 'domain/usecases/get_categories_usecase.dart';
import 'presentation/controller/get_categories/get_categories_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initCategoriesFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<GetDishCubit>(() => GetDishCubit(_sl()));
  _sl.registerLazySingleton<GetDishesCubit>(() => GetDishesCubit(_sl()));
  _sl.registerLazySingleton<GetCategoryCubit>(() => GetCategoryCubit(_sl()));
  _sl.registerLazySingleton<GetCategoriesCubit>(() => GetCategoriesCubit(_sl()));

  ///-> UseCases
  _sl.registerLazySingleton<GetDishUseCase>(() => GetDishUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetDishesUseCase>(() => GetDishesUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetCategoryUseCase>(() => GetCategoryUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<CategoriesRepository>(() => CategoriesRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<CategoriesRemoteDataSource>(() => CategoriesRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get categoriesBlocs => <BlocProvider>[
  BlocProvider<GetDishCubit>(
    create: (BuildContext context) => _sl<GetDishCubit>(),
  ),

  BlocProvider<GetDishesCubit>(
    create: (BuildContext context) => _sl<GetDishesCubit>(),
  ),

  BlocProvider<GetCategoryCubit>(
    create: (BuildContext context) => _sl<GetCategoryCubit>(),
  ),

  BlocProvider<GetCategoriesCubit>(
    create: (BuildContext context) => _sl<GetCategoriesCubit>(),
  ),
];
