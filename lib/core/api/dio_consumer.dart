import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../../injection_container.dart';
import '../error/exceptions.dart';
import '../utils/extension.dart';
import '../utils/log_utils.dart';
import 'status_code.dart';

abstract class DioConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });

  Future<dynamic> post(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  void updateLanguageCodeHeader();
}

abstract class ApiConstants {
  // static const String staging = 'https://staging.wallpepper.neop.co';
  static const String live = 'https://wallpepper.neop.co';
  static const String baseUrl = live;
}

class DioConsumerImpl implements DioConsumer {
  final Dio client;

  DioConsumerImpl({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    Map<String, String?> header = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.acceptLanguageHeader: 'ar',
    };

    client.options
      ..baseUrl = ApiConstants.baseUrl
      ..contentType = 'application/json'
      ..headers = header;

    client.interceptors.add(appInterceptors);
    if (kDebugMode) {
      client.interceptors.add(logInterceptor);
    }
  }

  Future<void> _handleAccessTokenHeader() async {
    final String? accessToken = await secureStorage.getAccessToken();
    if (accessToken != null) {
      client.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer $accessToken';
    }
  }

  @override
  void updateLanguageCodeHeader() {
    client.options.headers[HttpHeaders.acceptLanguageHeader] =
        sharedPreferences.getLanguageCode();
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      String? userKeyHeader}) async {
    try {
      Log.i(
          '[GET][$path], params: ${queryParameters.toString()}, body: ${body.toString()}');
      await _handleAccessTokenHeader();
      final response =
          await client.get(path, queryParameters: queryParameters, data: body);
      Log.i('[GET][$path], response: ${response.data.toString()}');
      return response.data;
    } on SocketException {
      throw const InternetConnectionException(message: 'noInternetConnection');
    } on DioException catch (error) {
      _handleDioError(error);
    } catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future post(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    String? userKeyHeader,
  }) async {
    try {
      Log.i(
          '[POST][$path], formData: ${formData?.toPrint}, body: ${body.toString()}, params: ${queryParameters.toString()}');
      await _handleAccessTokenHeader();
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formData ?? body,
      );
      Log.i('[POST][$path], response: ${response.data.toString()}');
      return response.data;
    } on SocketException {
      throw const InternetConnectionException(message: 'noInternetConnection');
    } on DioException catch (error) {
      _handleDioError(error);
    } catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future put(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    String? userKeyHeader,
  }) async {
    try {
      Log.i(
          '[PUT][$path], formData: ${formData?.toPrint}, body: ${body.toString()}, params: ${queryParameters.toString()}');
      await _handleAccessTokenHeader();
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: formData ?? body,
      );
      Log.i('[PUT][$path], response: ${response.data.toString()}');
      return response.data;
    } on SocketException {
      throw const InternetConnectionException(message: 'noInternetConnection');
    } on DioException catch (error) {
      _handleDioError(error);
    } catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? userKeyHeader,
  }) async {
    try {
      await _handleAccessTokenHeader();
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
      );
      Log.i('[DELETE][$path], response: ${response.data.toString()}');
      return response.data;
    } on SocketException {
      throw const InternetConnectionException(message: 'noInternetConnection');
    } on DioException catch (error) {
      _handleDioError(error);
    } catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  void _handleDioError(DioException error) {
    if (error.response?.statusCode == StatusCode.unauthorized) {
      throw UnauthorizedException(
          message:
              error.response?.data['error'] ?? error.response?.data.toString());
    }
    if (error.type == DioExceptionType.unknown) {
      throw const InternetConnectionException(message: 'noInternetConnection');
    }
    throw ServerException(
      message: error.response?.data['error'] ?? error.response?.data.toString(),
    );
  }
}
