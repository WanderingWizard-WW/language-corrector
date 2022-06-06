// ignore_for_file: unnecessary_lambdas

import 'package:equatable/equatable.dart';
import 'package:language_corrector/core/utils/string_extension.dart';
import 'package:language_corrector/data/texts/models/rule_url_model.dart';
import 'package:language_corrector/data/texts/models/text_error_category_model.dart';

class TextErrorRuleModel extends Equatable {
  const TextErrorRuleModel({
    required this.category,
    required this.description,
    required this.id,
    required this.issueType,
    required this.subId,
    required this.urls,
  });

  factory TextErrorRuleModel.fromJson(Map<String, dynamic> json) {
    return TextErrorRuleModel(
      category: json['category'] != null
          ? TextErrorCategoryModel.fromJson(json['category'])
          : const TextErrorCategoryModel(
              id: StringExtensions.empty,
              name: StringExtensions.empty,
            ),
      description: json['description'] ?? StringExtensions.empty,
      id: json['id'] ?? StringExtensions.empty,
      issueType: json['issueType'] ?? StringExtensions.empty,
      subId: json['subId'] ?? StringExtensions.empty,
      urls: json['urls'] != null
          ? (json['urls'] as List).map((i) => RuleUrlModel.fromJson(i)).toList()
          : [],
    );
  }

  final TextErrorCategoryModel category;
  final String description;
  final String id;
  final String issueType;
  final String subId;
  final List<RuleUrlModel> urls;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['id'] = id;
    data['issueType'] = issueType;
    data['subId'] = subId;
    data['category'] = category.toJson();
    data['urls'] = urls.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  List<Object> get props => [
        category,
        description,
        id,
        issueType,
        subId,
        urls,
      ];
}
