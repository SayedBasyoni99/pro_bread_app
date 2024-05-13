import 'package:equatable/equatable.dart';

class ToggleFavoriteResponse extends Equatable{
  final int status;
  final String message;

  const ToggleFavoriteResponse({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    message,
  ];
}



