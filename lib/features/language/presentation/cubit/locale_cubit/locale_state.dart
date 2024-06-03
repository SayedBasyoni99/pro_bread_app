part of 'locale_cubit.dart';

class LocaleState extends Equatable {
  final Locale locale;
  final String? errorMessage;

  const LocaleState({
    required this.locale,
    this.errorMessage,
  });

  @override
  List<Object?> get props => <Object?>[locale, errorMessage];
}
