import 'package:json_annotation/json_annotation.dart';

part 'dogs.g.dart';

@JsonSerializable()
class Dogs {
  Dogs({this.message, this.status});

  List<String>? message;
  String? status;

  factory Dogs.fromJson(Map<String, dynamic> json) =>
      _$DogsFromJson(json);
  Map<String, dynamic> toJson() => _$DogsToJson(this);
}