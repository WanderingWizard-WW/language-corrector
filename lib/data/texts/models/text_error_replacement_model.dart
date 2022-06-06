import 'package:equatable/equatable.dart';

class TextErrorReplacementModel extends Equatable {
  const TextErrorReplacementModel({required this.value});

  factory TextErrorReplacementModel.fromJson(Map<String, dynamic> json) {
    return TextErrorReplacementModel(
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
  List<Object> get props => [value];
}
