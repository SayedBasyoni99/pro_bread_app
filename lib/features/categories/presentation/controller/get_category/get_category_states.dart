part of 'get_category_cubit.dart';


abstract class GetCategoryState extends Equatable {

  const GetCategoryState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetCategoryInitialState extends GetCategoryState {
  const GetCategoryInitialState();
}

class GetCategoryLoadingState extends GetCategoryState {
  const GetCategoryLoadingState();
}

class GetCategorySuccessState extends GetCategoryState {
  final Category? value;

  const GetCategorySuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetCategoryErrorState extends GetCategoryState {
  final String message;

  const GetCategoryErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}

