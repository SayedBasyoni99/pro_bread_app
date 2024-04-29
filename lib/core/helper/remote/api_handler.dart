// import 'package:dio/dio.dart';

// mixin HandlingApiManager {
//   Future<T> wrapHandleRequest<T>({
//     required Future<Response> Function() tryCall,
//     required FromJson<T> jsonConvert,
//   }) async {
//     try {
//       final response = await tryCall();
//       if (response.statusCode == ResponseCode.SUCCESS) {
//         return jsonConvert(response.data);
//       } else {
//         throw ServerFailure(message: response.data.toString(), statusCode: response.statusCode ?? -1);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
