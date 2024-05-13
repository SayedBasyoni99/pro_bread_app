import 'package:equatable/equatable.dart';

import 'get_dish_response.dart';

class GetCategoryResponse extends Equatable{
  final Category data;

  const GetCategoryResponse({
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    data,
  ];
}


class Category extends Equatable {
  final int id;
  final String name;
  final String avatar;
  final List<Dish> dishes;

  const Category({
    required this.id,
    required this.name,
    required this.avatar,
    required this.dishes,
  });

  Category copyWith({
    int? id,
    String? name,
    String? avatar,
    List<Dish>? dishes,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      dishes: dishes ?? this.dishes,
    );
  }

  @override
  List<Object?> get props =>
      <Object?>[
        id,
        name,
        avatar,
        dishes,
      ];

}

