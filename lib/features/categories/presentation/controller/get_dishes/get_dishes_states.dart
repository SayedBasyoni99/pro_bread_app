part of 'get_dishes_cubit.dart';


abstract class GetDishesState extends Equatable {

  const GetDishesState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetDishesInitialState extends GetDishesState {
  const GetDishesInitialState();
}

class GetDishesLoadingState extends GetDishesState {
  const GetDishesLoadingState();
}

class GetDishesSuccessState extends GetDishesState {
  final List<Dish> value;

  const GetDishesSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetDishesErrorState extends GetDishesState {
  final String message;

  const GetDishesErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}

