import 'package:json_annotation/json_annotation.dart';

part 'lab3_serializers.g.dart';

@JsonSerializable()
class TaskData {
  @JsonKey(name: 'alternatives')
  List<String> alternatives;

  @JsonKey(name: 'states')
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
  @JsonKey(name: 'Laplasus')
  List<List<dynamic>> laplasus;
  @JsonKey(name: 'Savidge')
  List<List<dynamic>> savige;

  AnswerData(this.laplasus, this.savige);
  factory AnswerData.fromJson(Map<String, dynamic> json) =>
      _$AnswerDataFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerDataToJson(this);
}
