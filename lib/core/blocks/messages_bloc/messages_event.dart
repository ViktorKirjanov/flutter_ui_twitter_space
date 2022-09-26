part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

class InitRandomMessagesEvent extends MessagesEvent {}

class TickedMessagesEvent extends MessagesEvent {
  final EmojiMessage emojiMessage;

  const TickedMessagesEvent(this.emojiMessage);

  @override
  List<Object> get props => [emojiMessage];
}

class AddMessagesEvent extends MessagesEvent {
  final Emojis emoji;

  const AddMessagesEvent(this.emoji);

  @override
  List<Object> get props => [emoji];
}
