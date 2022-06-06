import 'package:equatable/equatable.dart';

class TextErrorContextModel extends Equatable {
  const TextErrorContextModel({
    required this.length,
    required this.offset,
    required this.text,
  });

  factory TextErrorContextModel.fromJson(Map<String, dynamic> json) {
    return TextErrorContextModel(
      length: json['length'],
      offset: json['offset'],
      text: json['text'],
    );
  }

  final int length;
  final int offset;
  final String text;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['length'] = length;
    data['offset'] = offset;
    data['text'] = text;
    return data;
  }

  @override
  List<Object> get props => [length, offset, text];
}
