import 'package:equatable/equatable.dart';

import 'get_category_response.dart';

class GetCategoriesResponse extends Equatable{
  final List<Category> data;

  const GetCategoriesResponse({
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    data,
  ];
}