import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/models/ask/message_model.dart';

class ChatRepository {
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static IOSOptions _getIOSOptions() => const IOSOptions(
        accountName: 'QnA',
      );

  static FlutterSecureStorage storage = FlutterSecureStorage(
    iOptions: _getIOSOptions(),
    aOptions: _getAndroidOptions(),
  );

  Future<List<Message>> loadMessages() async {
    String? messagesJson = await storage.read(key: 'messages');
    if (messagesJson == null) {
      return [
        Message(
          content: '안녕하세요. 무엇이든 물어봐주세요!',
          dateTime: DateTime.now().toUtc().add(
                const Duration(hours: 9),
              ),
        )
      ];
    }
    List<dynamic> messagesJsonList = jsonDecode(messagesJson);
    return messagesJsonList
        .map((messageJson) => Message.fromJson(messageJson))
        .toList();
  }

  Future<void> saveMessages(List<Message> messages) async {
    String messagesJson = jsonEncode(messages);
    await storage.write(key: 'messages', value: messagesJson);
  }

  Future<void> delectMessages() async {
    await storage.deleteAll();
  }
}
