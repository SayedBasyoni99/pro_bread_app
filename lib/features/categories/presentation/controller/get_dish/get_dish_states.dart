part of 'get_dish_cubit.dart';


abstract class GetDishState extends Equatable {

  const GetDishState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetDishInitialState extends GetDishState {
  const GetDishInitialState();
}

class GetDishLoadingState extends GetDishState {
  const GetDishLoadingState();
}

class GetDishSuccessState extends GetDishState {
  final Dish? value;

  const GetDishSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetDishErrorState extends GetDishState {
  final String message;

  const GetDishErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}

