import 'package:equatable/equatable.dart';

import 'get_category_response.dart';

class GetDishResponse extends Equatable{
  final Dish data;

  const GetDishResponse({
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    data,
  ];
}


class Dish extends Equatable {
  final int id;
  final String name;
  final String description;
  final String avatar;
  final String price;
  final int sales;
  final int rating;
  final int newDish;
  final int time;
  final bool isFav;
  final Category? category;
  final List<DishFeature> features;

  const Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.avatar,
    required this.price,
    required this.sales,
    required this.rating,
    required this.newDish,
    required this.time,
    required this.isFav,
    required this.category,
    required this.features,
  });

  Dish copyWith({
    int? id,
    String? name,
    String? description,
    String? avatar,
    String? price,
    int? sales,
    int? rating,
    int? newDish,
    int? time,
    bool? isFav,
    Category? category,
    List<DishFeature>? features,
  }) {
    return Dish(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      price: price ?? this.price,
      sales: sales ?? this.sales,
      rating: rating ?? this.rating,
      newDish: newDish ?? this.newDish,
      time: time ?? this.time,
      isFav: isFav ?? this.isFav,
      category: category ?? this.category,
      features: features ?? this.features,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    description,
    avatar,
    price,
    sales,
    rating,
    newDish,
    time,
    isFav,
    category,
    features,
  ];

}

class DishFeature extends Equatable {
  final int id;
  final String name;
  final int type;
  final List<DishFeatureData> data;

  const DishFeature({
    required this.id,
    required this.name,
    required this.type,
    required this.data,
  });

  DishFeature copyWith({
    int? id,
    String? name,
    int? type,
    List<DishFeatureData>? data,
  }) {
    return DishFeature(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    type,
    data,
  ];

}

class DishFeatureData extends Equatable {
  final String name;
  final String price;

  const DishFeatureData({
    required this.name,
    required this.price,
  });

  DishFeatureData copyWith({
    String? name,
    String? price,
  }) {
    return DishFeatureData(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    name,
    price,
  ];

}


