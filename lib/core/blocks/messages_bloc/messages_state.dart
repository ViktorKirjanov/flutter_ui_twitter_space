part of 'messages_bloc.dart';

@immutable
abstract class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

class MessagesInitial extends MessagesState {}

class CompleteMessagesState extends MessagesState {
  final EmojiMessage emojiMessage;

  const CompleteMessagesState(this.emojiMessage);

  @override
  List<Object> get props => [emojiMessage];
}
