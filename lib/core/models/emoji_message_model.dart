import 'package:equatable/equatable.dart';

import '../enums/emojis_enum.dart';

class EmojiMessage extends Equatable {
  final String uid;
  final Emojis emoji;

  const EmojiMessage({
    required this.uid,
    required this.emoji,
  });

  @override
  List<Object?> get props => [uid, emoji];
}
