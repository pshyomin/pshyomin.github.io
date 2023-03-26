part of 'ask_bloc.dart';

@immutable
abstract class AskState extends Equatable {
  const AskState();

  @override
  List<Object> get props => [];
}

class Initial extends AskState {}

class Loading extends AskState {}

class Loaded extends AskState {
  final List<Message> messages;
  const Loaded(this.messages);

  @override
  List<Object> get props => [messages];
}

class Failed extends AskState {
  final String message;
  const Failed(this.message);

  @override
  List<Object> get props => [message];
}
