part of 'toggle_favorite_cubit.dart';


abstract class ToggleFavoriteState extends Equatable {
  abstract final int dishId;
  const ToggleFavoriteState();

  @override
  List<Object?> get props => <Object?>[dishId];
}

class ToggleFavoriteInitialState extends ToggleFavoriteState {
  @override
  final int dishId;

  const ToggleFavoriteInitialState(this.dishId);
}

class ToggleFavoriteLoadingState extends ToggleFavoriteState {
  @override
  final int dishId;

  const ToggleFavoriteLoadingState(this.dishId);
}

class ToggleFavoriteSuccessState extends ToggleFavoriteState {
  @override
  final int dishId;
  final bool isFavorite;

  const ToggleFavoriteSuccessState({required this.isFavorite, required this.dishId});
  @override
  List<Object?> get props => <Object?>[isFavorite];

}

class ToggleFavoriteErrorState extends ToggleFavoriteState {
  @override
  final int dishId;
  final String message;

  const ToggleFavoriteErrorState({required this.message, required this.dishId});

  @override
  List<Object?> get props => <Object?>[message];
}

