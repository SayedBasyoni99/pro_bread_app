import 'package:equatable/equatable.dart';

class SendOtpResponse extends Equatable{
  final int status;
  final String message;
  final int data;

  const SendOtpResponse({
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



