import 'package:equatable/equatable.dart';

class CheckOtpResponse extends Equatable{
  final int status;
  final String message;

  const CheckOtpResponse({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    message,
  ];
}



