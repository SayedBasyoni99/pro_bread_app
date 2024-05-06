import 'package:equatable/equatable.dart';

class UpdateOrderDeliveryTimeResponse extends Equatable{
  final String message;
  final int status;

  const UpdateOrderDeliveryTimeResponse({
    required this.message,
    required this.status,
  });

  @override
  List<Object?> get props => <Object?>[
    message,
    status,
  ];
}



