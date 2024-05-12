import 'package:equatable/equatable.dart';

class ForgetPasswordResponse extends Equatable{
  final int statusCode;
  final String message;

  const ForgetPasswordResponse({
    required this.statusCode,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    statusCode,
    message,
  ];
}



