import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable{
  final int status;
  final String message;
  final int? data;

  const RegisterResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    message,
    data,
  ];
}



