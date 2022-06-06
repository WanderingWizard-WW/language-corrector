// ignore_for_file: unnecessary_lambdas

import 'package:language_corrector/core/utils/string_extension.dart';
import 'package:language_corrector/data/texts/models/api_detected_language_model.dart';
import 'package:language_corrector/data/texts/models/api_language_data_model.dart';
import 'package:language_corrector/data/texts/models/api_software_data_model.dart';
import 'package:language_corrector/data/texts/models/text_errors_match_model.dart';

class ApiResponse {
  ApiResponse({
    required this.language,
    required this.matches,
    required this.software,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      language: json['language'] != null
          ? ApiLanguageDataModel.fromJson(json['language'])
          : const ApiLanguageDataModel(
              detectedLanguage: ApiDetectedLanguageModel(
                name: StringExtensions.empty,
                code: StringExtensions.empty,
              ),
              name: StringExtensions.empty,
              code: StringExtensions.empty,
            ),
      matches: json['matches'] != null
          ? (json['matches'] as List)
              .map((i) => TextErrorsMatch.fromJson(i))
              .toList()
          : [],
      software: json['software'] != null
          ? ApiSoftwareDataModel.fromJson(json['software'])
          : const ApiSoftwareDataModel(
              buildDate: StringExtensions.empty,
              name: StringExtensions.empty,
              version: StringExtensions.empty,
              premium: false,
              apiVersion: 1,
              status: StringExtensions.empty,
            ),
    );

  }

  ApiLanguageDataModel language;
  List<TextErrorsMatch> matches;
  ApiSoftwareDataModel software;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['language'] = language.toJson();
    data['matches'] = matches.map((v) => v.toJson()).toList();
    data['software'] = software.toJson();
    return data;
  }
}
