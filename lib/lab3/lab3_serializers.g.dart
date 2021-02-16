// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab3_serializers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskData _$TaskDataFromJson(Map<String, dynamic> json) {
  return TaskData(
    (json['alternatives'] as List)?.map((e) => e as String)?.toList(),
    (json['states'] as List)?.map((e) => e as String)?.toList(),
    (json['matrix'] as List)
        ?.map((e) => (e as List)?.map((e) => e as int)?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$TaskDataToJson(TaskData instance) => <String, dynamic>{
      'alternatives': instance.alternatives,
      'states': instance.possibilities,
      'matrix': instance.matrix,
    };

AnswerData _$AnswerDataFromJson(Map<String, dynamic> json) {
  return AnswerData(
    (json['Laplasus'] as List)?.map((e) => e as List)?.toList(),
    (json['Savidge'] as List)?.map((e) => e as List)?.toList(),
  );
}

Map<String, dynamic> _$AnswerDataToJson(AnswerData instance) =>
    <String, dynamic>{
      'Laplasus': instance.laplasus,
      'Savidge': instance.savige,
    };
