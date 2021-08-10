import 'package:json_annotation/json_annotation.dart';
import 'package:plent/models/working_mode.dart';

part 'configuration.g.dart';

@JsonSerializable()
class Configuration {
  Configuration({this.workingMode});

  final WorkingMode? workingMode;

  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}
