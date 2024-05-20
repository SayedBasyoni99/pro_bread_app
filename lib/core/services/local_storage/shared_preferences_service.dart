import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/enums.dart';
import '../../utils/extension.dart';

abstract class _AppSharedPreferencesKeys {
  static const languageCode = 'languageCode';
  static const userType = 'userType';
}

abstract class SharedPreferencesService {
  final SharedPreferences instance;

  const SharedPreferencesService({
    required this.instance,
  });

  //region:: Language Code
  String getLanguageCode();

  Future<bool> saveLanguageCode(String value);

  Future<bool> removeLanguageCode();

  //endregion

  //region:: User Type
  UserType getUserType();

  Future<bool> saveUserType(UserType value);

  Future<bool> removeUserType();

  //endregion

  Future<bool> clearAll();
}

class AppSharedPreferencesImpl extends SharedPreferencesService {
  AppSharedPreferencesImpl({required super.instance});

  //region:: Language Code
  @override
  String getLanguageCode() {
    String value = instance.getString(_AppSharedPreferencesKeys.languageCode) ??
        Intl.getCurrentLocale().toString().split('_').first;
    return value;
  }

  @override
  Future<bool> saveLanguageCode(String value) {
    return instance.setString(_AppSharedPreferencesKeys.languageCode, value);
  }

  @override
  Future<bool> removeLanguageCode() =>
      instance.remove(_AppSharedPreferencesKeys.languageCode);

  //endregion


  //region:: User Type
  @override
  UserType getUserType() => UserTypeExtension.fromString(
      instance.getString(_AppSharedPreferencesKeys.userType) ?? '');

  @override
  Future<bool> saveUserType(UserType value) =>
      instance.setString(_AppSharedPreferencesKeys.userType, value.name);

  @override
  Future<bool> removeUserType() =>
      instance.remove(_AppSharedPreferencesKeys.userType);

//endregion

  @override
  Future<bool> clearAll() => instance.clear();
}
