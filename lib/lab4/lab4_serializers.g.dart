// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab4_serializers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskData _$TaskDataFromJson(Map<String, dynamic> json) {
  return TaskData(
    (json['matrix'] as List)
        ?.map((e) => (e as List)?.map((e) => e as int)?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$TaskDataToJson(TaskData instance) => <String, dynamic>{
      'matrix': instance.matrix,
    };

AnswerData _$AnswerDataFromJson(Map<String, dynamic> json) {
  return AnswerData(
    (json['answer'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$AnswerDataToJson(AnswerData instance) =>
    <String, dynamic>{
      'answer': instance.answer,
    };
