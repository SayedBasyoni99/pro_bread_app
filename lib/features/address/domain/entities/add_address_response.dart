import 'package:equatable/equatable.dart';

class AddAddressResponse extends Equatable{
  final String message;
  final int status;

  const AddAddressResponse({
    required this.message,
    required this.status,
  });

  @override
  List<Object?> get props => <Object?>[
    message,
    status,
  ];
}



