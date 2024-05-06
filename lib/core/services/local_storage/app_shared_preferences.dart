import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _AppSharedPreferencesKeys {
  // static const appTheme = 'appTheme';
  static const languageCode = 'languageCode';
  // static const userType = 'userType';
}

abstract class AppSharedPreferences {
  final SharedPreferences instance;

  const AppSharedPreferences({
    required this.instance,
  });

  //region:: Language Code
  String getLanguageCode();

  Future<bool> saveLanguageCode(String value);

  Future<bool> removeLanguageCode();

  //endregion

  // //region:: App Theme
  // Themes getAppTheme();

  // Future<bool> saveAppTheme(Themes theme);

  // Future<bool> removeAppTheme();

  // //endregion

  // //region:: User Type
  // UserType getUserType();

  // Future<bool> saveUserType(UserType value);

  // Future<bool> removeUserType();

  // //endregion

  Future<bool> clearAll();
}

class AppSharedPreferencesImpl extends AppSharedPreferences {
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
    return instance.setString(
        _AppSharedPreferencesKeys.languageCode, value);
  }

  @override
  Future<bool> removeLanguageCode() =>
      instance.remove(_AppSharedPreferencesKeys.languageCode);

  //endregion

  // //region:: App Theme
  // @override
  // Themes getAppTheme() {
  //   String value = instance.getString(_AppSharedPreferencesKeys.appTheme) ?? '';
  //   return ThemesExtension.fromString(value);
  // }

  // @override
  // Future<bool> saveAppTheme(Themes theme) =>
  //     instance.setString(_AppSharedPreferencesKeys.appTheme, theme.name);

  // @override
  // Future<bool> removeAppTheme() =>
  //     instance.remove(_AppSharedPreferencesKeys.appTheme);

  // //endregion

  //region:: User Type
//   @override
//   UserType getUserType() => UserTypeExtension.fromString(
//       instance.getString(_AppSharedPreferencesKeys.userType) ?? '');

//   @override
//   Future<bool> saveUserType(UserType value) =>
//       instance.setString(_AppSharedPreferencesKeys.userType, value.name);

//   @override
//   Future<bool> removeUserType() =>
//       instance.remove(_AppSharedPreferencesKeys.userType);

// //endregion

  @override
  Future<bool> clearAll() => instance.clear();
}
