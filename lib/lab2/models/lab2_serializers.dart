import 'package:json_annotation/json_annotation.dart';

part 'lab2_serializers.g.dart';

@JsonSerializable()
class TaskData {
  @JsonKey(name: 'As')
  List<String> alternatives;

  @JsonKey(name: 'Xs')
  List<String> possibilities;

  @JsonKey()
  List<List<int>> matrix;

  TaskData(this.alternatives, this.possibilities, this.matrix);

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDataToJson(this);
}

@JsonSerializable()
class AnswerData {
  @JsonKey()
  List<List<dynamic>> gurvizza;
  @JsonKey()
  List<List<dynamic>> maxmax;
  @JsonKey(name: 'maxmin')
  List<List<dynamic>> valde;

  AnswerData(this.gurvizza, this.maxmax, this.valde);
  factory AnswerData.fromJson(Map<String, dynamic> json) =>
      _$AnswerDataFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerDataToJson(this);
}
