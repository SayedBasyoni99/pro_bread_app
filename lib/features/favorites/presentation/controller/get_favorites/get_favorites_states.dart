part of 'get_favorites_cubit.dart';


abstract class GetFavoritesState extends Equatable {

  const GetFavoritesState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetFavoritesInitialState extends GetFavoritesState {
  const GetFavoritesInitialState();
}

class GetFavoritesLoadingState extends GetFavoritesState {
  const GetFavoritesLoadingState();
}

class GetFavoritesSuccessState extends GetFavoritesState {
  final List<Dish> value;

  const GetFavoritesSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetFavoritesErrorState extends GetFavoritesState {
  final String message;

  const GetFavoritesErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}

