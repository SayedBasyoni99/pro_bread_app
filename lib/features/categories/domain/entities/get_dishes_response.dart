import 'package:equatable/equatable.dart';

import 'get_dish_response.dart';

class GetDishesResponse extends Equatable{
  final List<Dish> data;

  const GetDishesResponse({
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    data,
  ];
}


