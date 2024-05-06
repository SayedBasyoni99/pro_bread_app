import 'package:dio/dio.dart';

extension FormDataExtension on FormData {
  String get toPrint {
    Map<String, dynamic> result = {};
    for(final item in fields){
      result[item.key] = item.value;
    }
    for(final item in files){
      result[item.key] = item.value;
    }
    return result.toString();
  }
}