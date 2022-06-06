import 'package:equatable/equatable.dart';

class TextErrorCategoryModel extends Equatable {
  const TextErrorCategoryModel({required this.id, required this.name});

  factory TextErrorCategoryModel.fromJson(Map<String, dynamic> json) {
    return TextErrorCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  final String id;
  final String name;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  @override
  List<Object> get props => [id, name];
}
