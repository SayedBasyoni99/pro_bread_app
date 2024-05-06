import 'package:equatable/equatable.dart';

class CompleteRegisterResponse extends Equatable{
  final int status;
  final String message;

  const CompleteRegisterResponse({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    message,
  ];
}



