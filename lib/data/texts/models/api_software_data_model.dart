import 'package:equatable/equatable.dart';

class ApiSoftwareDataModel extends Equatable {
  const ApiSoftwareDataModel({
    required this.apiVersion,
    required this.buildDate,
    required this.name,
    required this.premium,
    required this.status,
    required this.version,
  });

  factory ApiSoftwareDataModel.fromJson(Map<String, dynamic> json) {
    return ApiSoftwareDataModel(
      apiVersion: json['apiVersion'],
      buildDate: json['buildDate'],
      name: json['name'],
      premium: json['premium'],
      status: json['status'],
      version: json['version'],
    );
  }

  final int apiVersion;
  final String buildDate;
  final String name;
  final bool premium;
  final String status;
  final String version;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['apiVersion'] = apiVersion;
    data['buildDate'] = buildDate;
    data['name'] = name;
    data['premium'] = premium;
    data['status'] = status;
    data['version'] = version;
    return data;
  }

  @override
  List<Object> get props => [
        apiVersion,
        buildDate,
        name,
        premium,
        status,
        version,
      ];
}
