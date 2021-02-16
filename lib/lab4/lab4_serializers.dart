import 'package:json_annotation/json_annotation.dart';

part 'lab4_serializers.g.dart';

@JsonSerializable()
class TaskData {
  @JsonKey()
  List<List<int>> matrix;

  TaskData(this.matrix);

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDataToJson(this);
}

@JsonSerializable()
class AnswerData {
  @JsonKey()
  List<int> answer;

  AnswerData(this.answer);
  factory AnswerData.fromJson(Map<String, dynamic> json) =>
      _$AnswerDataFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerDataToJson(this);
}
