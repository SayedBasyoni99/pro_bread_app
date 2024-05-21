import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/app_snack_bar.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/change_lang.dart';
import '../../../domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(LocaleState(locale: Locale(sharedPreferencesService.getLanguageCode())));

  String currentLangCode = sharedPreferencesService.getLanguageCode();

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase(NoParams());
    response.fold(
      (failure) {
        emit(LocaleState(
          locale: Locale(currentLangCode),
          errorMessage: failure.message ?? 'please_try_again_later'.tr(),
        ));
      },
      (value) {
        currentLangCode = value;
        emit(LocaleState(locale: Locale(currentLangCode)));
      },
    );
  }

  Future<void> changeLanguage({
    required BuildContext context,
    required String langCode,
  }) async {
    final response = await changeLangUseCase(langCode);
    response.fold(
      (failure) {
        showAppSnackBar(
            context: context,
            message: 'please_try_again_later'.tr(),
            type: ToastType.error);
      },
      (value) {
        currentLangCode = langCode;
        final newLocal = Locale(currentLangCode);
        EasyLocalization.of(context)?.setLocale(newLocal);
        dioConsumer.updateLanguageCodeHeader();
        emit(LocaleState(locale: newLocal));
      },
    );
  }
}
