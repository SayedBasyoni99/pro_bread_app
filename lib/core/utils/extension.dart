import 'package:dio/dio.dart';

import 'enums.dart';

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

extension UserTypeExtension on UserType {
  static UserType fromString(String value) => UserType.values
      .firstWhere((UserType element) => element.name == value,
      orElse: () => UserType.firstOpen);
}