import 'package:equatable/equatable.dart';

class RuleUrlModel extends Equatable {
  const RuleUrlModel({required this.value});

  factory RuleUrlModel.fromJson(Map<String, dynamic> json) {
    return RuleUrlModel(
      value: json['value'],
    );
  }

  final String value;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    return data;
  }

  @override
  List<Object> get props => [];
}
