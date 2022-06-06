import 'package:equatable/equatable.dart';
import 'package:language_corrector/core/utils/string_extension.dart';
import 'package:language_corrector/data/texts/models/api_detected_language_model.dart';

class ApiLanguageDataModel extends Equatable {
  const ApiLanguageDataModel({
    required this.code,
    required this.detectedLanguage,
    required this.name,
  });

  factory ApiLanguageDataModel.fromJson(Map<String, dynamic> json) {
    return ApiLanguageDataModel(
      code: json['code'],
      detectedLanguage: json['detectedLanguage'] != null
          ? ApiDetectedLanguageModel.fromJson(json['detectedLanguage'])
          : const ApiDetectedLanguageModel(
              code: StringExtensions.empty,
              name: StringExtensions.empty,
            ),
      name: json['name'],
    );
  }

  final String code;
  final ApiDetectedLanguageModel detectedLanguage;
  final String name;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['detectedLanguage'] = detectedLanguage.toJson();
    return data;
  }

  @override
  List<Object> get props => [code, detectedLanguage, name];
}
