part of 'get_categories_cubit.dart';


abstract class GetCategoriesState extends Equatable {

  const GetCategoriesState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetCategoriesInitialState extends GetCategoriesState {
  const GetCategoriesInitialState();
}

class GetCategoriesLoadingState extends GetCategoriesState {
  const GetCategoriesLoadingState();
}

class GetCategoriesSuccessState extends GetCategoriesState {
  final List<Category> value;

  const GetCategoriesSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetCategoriesErrorState extends GetCategoriesState {
  final String message;

  const GetCategoriesErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}

