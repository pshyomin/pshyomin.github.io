import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '/models/ask/message_model.dart';
import '/repositorys/ask/chat_repository.dart';
import '/utils/ask/api.dart';

part 'ask_event.dart';
part 'ask_state.dart';

class AskBloc extends Bloc<AskEvent, AskState> {
  final ChatRepository chatRepository;
  final _messages = <Message>[];

  final _chatController = StreamController<List<Message>>.broadcast();
  Stream<List<Message>> get chatStream => _chatController.stream;

  AskBloc(this.chatRepository) : super(Initial()) {
    on<AskEvent>(
      (event, emit) async {
        if (event is FetchEvent) {
          emit(Loading());
          try {
            _messages.addAll(await chatRepository.loadMessages());
            emit(Loaded(_messages));
            _chatController.add(_messages);
          } catch (e) {
            emit(Failed(e.toString()));
          }
        }
      },
    );
    on<SendEvent>(_onSendEvent);
    on<DelectEvent>(_onDelectEvent);
  }

  Future<void> _onSendEvent(
    SendEvent event,
    Emitter<AskState> emit,
  ) async {
    final message = Message(
      content: event.content,
      isSentByMe: event.isSentByMe,
      dateTime: DateTime.now().toUtc().add(const Duration(hours: 9)),
    );

    final lastMessage = _messages.last;
    _messages.add(message);
    _chatController.add(_messages);

    if (event.isSentByMe == 0) {
      final response = await Api.getQnAResponse(message.content!,
          lastMessage.content!.isEmpty ? '' : lastMessage.content!);
      final answerMessage = Message(
        content: response,
        isSentByMe: 1,
        dateTime: DateTime.now().toUtc().add(const Duration(hours: 9)),
      );
      _messages.add(answerMessage);
    }

    _chatController.add(_messages);
    await chatRepository.saveMessages(_messages);
  }

  Future<void> _onDelectEvent(
    DelectEvent event,
    Emitter<AskState> emit,
  ) async {
    _messages.clear();
    await chatRepository.delectMessages();
  }
}
