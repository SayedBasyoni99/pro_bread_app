import 'package:equatable/equatable.dart';

import '../../../categories/domain/entities/get_dish_response.dart';

class GetFavoritesResponse extends Equatable{
  final int status;
  final List<Dish> data;

  const GetFavoritesResponse({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    data,
  ];
}
