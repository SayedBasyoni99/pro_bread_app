// import 'package:dio/dio.dart';
// import 'package:pro_bread_app/core/helper/dio/logger_interceptor.dart';

// import '../remote/remote_urls.dart';



// // @LazySingleton()
// class ApiClient {
//   final LoggerInterceptor loggingInterceptor;
//   late Dio dio;

//   ApiClient(Dio dioC, {required this.loggingInterceptor}) {
//     dio = dioC;
//     dio
//       ..options.baseUrl = RemoteUrls.baseUrl
//       ..options.connectTimeout = const Duration(milliseconds: 30000)
//       ..options.receiveTimeout = const Duration(milliseconds: 30000)
//       ..httpClientAdapter
//       ..options.headers = {
//         'Accept': 'application/json',
//         'Authorization': 'Bearer ',
//         'Accept-Language': 'en',
//       };
//     dio.interceptors.add(loggingInterceptor);
//   }

//   Future<Response> get(
//     String uri, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//     data,
//   }) async {
//     return await dio.get(uri,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress);
//   }

//   Future<Response> post(
//     String url, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     return await dio.post(url,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress);
//   }

//   Future<Response> put(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     return await dio.put(uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress);
//   }

//   Future<Response> delete(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) async {
//     return await dio.delete(uri,
//         data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
//   }

//   void updateToken(String token) => dio.options.headers['Authorization'] = 'Bearer $token';

//   void updateLanguage(String language) => dio.options.headers['Accept-Language'] = language;

//   // String? _getToken() => sl<SharedPreferences>().getString(PrefKeys.token);
// }
