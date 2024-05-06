import 'package:equatable/equatable.dart';

class EditAddressResponse extends Equatable{
  final String message;
  final int status;

  const EditAddressResponse({
    required this.message,
    required this.status,
  });

  @override
  List<Object?> get props => <Object?>[
    message,
    status,
  ];
}



