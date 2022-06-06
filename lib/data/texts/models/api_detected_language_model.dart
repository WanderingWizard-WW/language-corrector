import 'package:equatable/equatable.dart';

class ApiDetectedLanguageModel extends Equatable {
  const ApiDetectedLanguageModel({required this.code, required this.name});

  factory ApiDetectedLanguageModel.fromJson(Map<String, dynamic> json) {
    return ApiDetectedLanguageModel(
      code: json['code'],
      name: json['name'],
    );
  }

  final String code;
  final String name;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }

  @override
  List<Object> get props => [code, name];
}
