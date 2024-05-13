import 'package:equatable/equatable.dart';

class UpdatePasswordResponse extends Equatable{
  final int statusCode;
  final String message;

  const UpdatePasswordResponse({
    required this.statusCode,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    statusCode,
    message,
  ];
}



