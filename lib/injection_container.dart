import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';

abstract class ServiceLocator {
  static final GetIt instance = GetIt.instance;

  static Future<void> init() async {
    instance.allowReassignment = true;

    /// Features
    await init();

    /// Core
    _injectDioConsumer();
    _injectAppInterceptors();
    _injectLogInterceptor();
  }

  static void _injectDioConsumer() {
    instance.registerLazySingleton<DioConsumer>(
        () => DioConsumerImpl(client: Dio()));
  }

  static void _injectAppInterceptors() {
    instance.registerLazySingleton(() => AppInterceptors());
  }

  static void _injectLogInterceptor() {
    instance.registerLazySingleton(() => LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          error: true,
        ));
  }
}

DioConsumer get dioConsumer => ServiceLocator.instance<DioConsumer>();

AppInterceptors get appInterceptors =>
    ServiceLocator.instance<AppInterceptors>();

LogInterceptor get logInterceptor => ServiceLocator.instance<LogInterceptor>();
