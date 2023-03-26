import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class Message {
  String? content;
  int? isSentByMe;
  DateTime dateTime;
  Message({
    this.content = '',
    this.isSentByMe = 1,
    required this.dateTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
