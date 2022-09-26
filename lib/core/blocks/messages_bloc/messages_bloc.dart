import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/users.dart';
import '../../enums/emojis_enum.dart';
import '../../models/emoji_message_model.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  late Timer timer;
  var users = UserData.getUsers();

  MessagesBloc() : super(MessagesInitial()) {
    on<InitRandomMessagesEvent>((event, emit) {
      timer = Timer.periodic(const Duration(milliseconds: 2000), (_) {
        var random = Random();
        var randomUser = users[1 + random.nextInt(users.length - 1)];
        var randomEmoji = Emojis.values[random.nextInt(Emojis.values.length)];
        var message = EmojiMessage(uid: randomUser.uid, emoji: randomEmoji);
        if (!super.isClosed) {
          add(TickedMessagesEvent(message));
        }
      });
    });

    on<TickedMessagesEvent>((event, emit) {
      emit(CompleteMessagesState(event.emojiMessage));
    });

    on<AddMessagesEvent>((event, emit) {
      var emojiMessage = EmojiMessage(uid: users[0].uid, emoji: event.emoji);
      emit(CompleteMessagesState(emojiMessage));
    });
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
