import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/services/local_storage/secure_storage_service.dart';
import 'core/services/local_storage/shared_preferences_service.dart';
import 'features/address/address_injection.dart';
import 'features/auth/auth_injection.dart';
import 'features/categories/categories_injection.dart';
import 'features/favorites/favorites_injection.dart';
import 'features/home/home_injection.dart';
import 'features/orders/orders_injection.dart';

abstract class ServiceLocator {
  static final GetIt instance = GetIt.instance;

  static Future<void> init() async {
    instance.allowReassignment = true;

    /// Features
    await initHomeFeatureInjection();
    await initAddressFeatureInjection();
    await initAuthFeatureInjection();
    await initCategoriesFeatureInjection();
    await initFavoritesFeatureInjection();
    await initOrdersFeatureInjection();

    /// Core
    await _injectSharedPreferences();
    _injectSharedPreferencesService();
    _injectSecureStorageService();
    _injectSecureStorage();
    _injectDioConsumer();
    _injectAppInterceptors();
    _injectLogInterceptor();
    _injectSharedPreferences();
    _injectSecureStorage();
  }

  static void _injectDioConsumer() {
    instance.registerLazySingleton<DioConsumer>(
            () => DioConsumerImpl(client: Dio()));
  }

  static void _injectAppInterceptors() {
    instance.registerLazySingleton(() => AppInterceptors());
  }

  static void _injectLogInterceptor() {
    instance.registerLazySingleton(() =>
        LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          error: true,
        ));
  }


  static Future<void> _injectSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }

  static Future<void> _injectSharedPreferencesService() async {
    instance.registerLazySingleton<SharedPreferencesService>(
            () => AppSharedPreferencesImpl(instance: instance()));
  }

  static void _injectSecureStorage() {
    AndroidOptions androidOptions =
    const AndroidOptions(encryptedSharedPreferences: true);
    // IOSOptions iosOptions = const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
    final FlutterSecureStorage secureStorage = FlutterSecureStorage(
      aOptions: androidOptions,
      // iOptions: iosOptions,
    );
    instance.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
  }

  static void _injectSecureStorageService() {
    instance.registerLazySingleton<SecureStorageService>(
            () => SecureStorageServiceImpl(instance: instance()));
  }

}

DioConsumer get dioConsumer => ServiceLocator.instance<DioConsumer>();

AppInterceptors get appInterceptors =>
    ServiceLocator.instance<AppInterceptors>();

LogInterceptor get logInterceptor => ServiceLocator.instance<LogInterceptor>();

SharedPreferencesService get sharedPreferencesService =>
      ServiceLocator.instance<SharedPreferencesService>();

SecureStorageService get secureStorageService =>
      ServiceLocator.instance<SecureStorageService>();
