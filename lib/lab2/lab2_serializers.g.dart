// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab2_serializers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskData _$TaskDataFromJson(Map<String, dynamic> json) {
  return TaskData(
    (json['As'] as List)?.map((e) => e as String)?.toList(),
    (json['Xs'] as List)?.map((e) => e as String)?.toList(),
    (json['matrix'] as List)
        ?.map((e) => (e as List)?.map((e) => e as int)?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$TaskDataToJson(TaskData instance) => <String, dynamic>{
      'As': instance.alternatives,
      'Xs': instance.possibilities,
      'matrix': instance.matrix,
    };

AnswerData _$AnswerDataFromJson(Map<String, dynamic> json) {
  return AnswerData(
    (json['gurvizza'] as List)?.map((e) => e as List)?.toList(),
    (json['maxmax'] as List)?.map((e) => e as List)?.toList(),
    (json['maxmin'] as List)?.map((e) => e as List)?.toList(),
  );
}

Map<String, dynamic> _$AnswerDataToJson(AnswerData instance) =>
    <String, dynamic>{
      'gurvizza': instance.gurvizza,
      'maxmax': instance.maxmax,
      'maxmin': instance.valde,
    };
