// ignore_for_file: unnecessary_lambdas

import 'package:equatable/equatable.dart';
import 'package:language_corrector/core/utils/string_extension.dart';
import 'package:language_corrector/data/texts/models/text_error_category_model.dart';
import 'package:language_corrector/data/texts/models/text_error_context_model.dart';
import 'package:language_corrector/data/texts/models/text_error_replacement_model.dart';
import 'package:language_corrector/data/texts/models/text_error_rule_model.dart';

class TextErrorsMatch extends Equatable {
  const TextErrorsMatch({
    required this.context,
    required this.length,
    required this.message,
    required this.offset,
    required this.replacements,
    required this.rule,
    required this.sentence,
    required this.shortMessage,
  });

  factory TextErrorsMatch.fromJson(Map<String, dynamic> json) {
    return TextErrorsMatch(
      context: json['context'] != null
          ? TextErrorContextModel.fromJson(json['context'])
          : const TextErrorContextModel(
              text: StringExtensions.empty,
              offset: 0,
              length: 0,
            ),
      length: json['length'],
      message: json['message'],
      offset: json['offset'],
      replacements: json['replacements'] != null
          ? (json['replacements'] as List)
              .map((i) => TextErrorReplacementModel.fromJson(i))
              .toList()
          : [],
      rule: json['rule'] != null
          ? TextErrorRuleModel.fromJson(json['rule'])
          : const TextErrorRuleModel(
              id: StringExtensions.empty,
              description: StringExtensions.empty,
              issueType: StringExtensions.empty,
              urls: [],
              subId: StringExtensions.empty,
              category: TextErrorCategoryModel(
                id: StringExtensions.empty,
                name: StringExtensions.empty,
              ),
            ),
      sentence: json['sentence'],
      shortMessage: json['shortMessage'],
    );
  }

  final TextErrorContextModel context;
  final int length;
  final String message;
  final int offset;
  final List<TextErrorReplacementModel> replacements;
  final TextErrorRuleModel rule;
  final String sentence;
  final String shortMessage;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['length'] = length;
    data['message'] = message;
    data['offset'] = offset;
    data['sentence'] = sentence;
    data['shortMessage'] = shortMessage;
    data['context'] = context.toJson();
    data['replacements'] = replacements.map((v) => v.toJson()).toList();
    data['rule'] = rule.toJson();
    return data;
  }

  @override
  List<Object> get props => [
        context,
        length,
        message,
        offset,
        replacements,
        rule,
        sentence,
        shortMessage,
      ];
}
