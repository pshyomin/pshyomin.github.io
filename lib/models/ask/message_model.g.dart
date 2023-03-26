// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      content: json['content'] as String? ?? '',
      isSentByMe: json['isSentByMe'] as int? ?? 1,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'content': instance.content,
      'isSentByMe': instance.isSentByMe,
      'dateTime': instance.dateTime.toIso8601String(),
    };
