import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/orders_remote_datasource.dart';
import 'data/repositories/orders_repo_impl.dart';
import 'domain/repositories/orders_repo.dart';
import 'domain/usecases/get_delivery_hours_usecase.dart';
import 'presentation/controller/get_delivery_hours/get_delivery_hours_cubit.dart';
import 'domain/usecases/update_order_delivery_time_usecase.dart';
import 'presentation/controller/update_order_delivery_time/update_order_delivery_time_cubit.dart';
import 'domain/usecases/follow_order_usecase.dart';
import 'presentation/controller/follow_order/follow_order_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initOrdersFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<GetDeliveryHoursCubit>(() => GetDeliveryHoursCubit(_sl()));
  _sl.registerLazySingleton<UpdateOrderDeliveryTimeCubit>(() => UpdateOrderDeliveryTimeCubit(_sl()));
  _sl.registerLazySingleton<FollowOrderCubit>(() => FollowOrderCubit(_sl()));

  ///-> UseCases
  _sl.registerLazySingleton<GetDeliveryHoursUseCase>(() => GetDeliveryHoursUseCase(repository: _sl()));
  _sl.registerLazySingleton<UpdateOrderDeliveryTimeUseCase>(() => UpdateOrderDeliveryTimeUseCase(repository: _sl()));
  _sl.registerLazySingleton<FollowOrderUseCase>(() => FollowOrderUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<OrdersRemoteDataSource>(() => OrdersRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get ordersBlocs => <BlocProvider>[
  BlocProvider<GetDeliveryHoursCubit>(
    create: (BuildContext context) => _sl<GetDeliveryHoursCubit>(),
  ),

  BlocProvider<UpdateOrderDeliveryTimeCubit>(
    create: (BuildContext context) => _sl<UpdateOrderDeliveryTimeCubit>(),
  ),

  BlocProvider<FollowOrderCubit>(
    create: (BuildContext context) => _sl<FollowOrderCubit>(),
  ),
];
