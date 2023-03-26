part of 'ask_bloc.dart';

@immutable
abstract class AskEvent extends Equatable {
  const AskEvent();

  @override
  List<Object> get props => [];
}

class FetchEvent extends AskEvent {
  const FetchEvent();
}

class SendEvent extends AskEvent {
  final String content;
  final int isSentByMe;
  const SendEvent(this.content, this.isSentByMe);

  @override
  List<Object> get props => [content, isSentByMe];
}

class DelectEvent extends AskEvent {
  const DelectEvent();
}
