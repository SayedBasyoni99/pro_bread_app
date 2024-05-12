part of 'toggle_favorite_cubit.dart';


abstract class ToggleFavoriteState extends Equatable {

  const ToggleFavoriteState();

  @override
  List<Object?> get props => <Object?>[];
}

class ToggleFavoriteInitialState extends ToggleFavoriteState {
  const ToggleFavoriteInitialState();
}

class ToggleFavoriteLoadingState extends ToggleFavoriteState {
  const ToggleFavoriteLoadingState();
}

class ToggleFavoriteSuccessState extends ToggleFavoriteState {
  const ToggleFavoriteSuccessState();

}

class ToggleFavoriteErrorState extends ToggleFavoriteState {
  final String message;

  const ToggleFavoriteErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}

