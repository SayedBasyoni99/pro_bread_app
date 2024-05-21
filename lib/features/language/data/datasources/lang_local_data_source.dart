import '../../../../injection_container.dart';

abstract class LangLocalDataSource {
  Future<void> changeLang({required String langCode});
  Future<String> getSavedLang();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {

  LangLocalDataSourceImpl();

  @override
  Future<void> changeLang({required String langCode}) async =>
      await sharedPreferencesService.saveLanguageCode(langCode);

  @override
  Future<String> getSavedLang() async =>
      sharedPreferencesService.getLanguageCode();
}
