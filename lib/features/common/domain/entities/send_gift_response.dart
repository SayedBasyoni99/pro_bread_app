import 'package:equatable/equatable.dart';

class SendGiftResponse extends Equatable{
  final String message;
  final int status;

  const SendGiftResponse({
    required this.message,
    required this.status,
  });

  @override
  List<Object?> get props => <Object?>[
    message,
    status,
  ];
}



