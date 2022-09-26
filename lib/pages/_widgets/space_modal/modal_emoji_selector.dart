import 'package:flutter/material.dart';
import 'package:flutter_ui_twitter_space/core/enums/emojis_enum.dart';

import 'modal_emoji_selector_button.dart';

class ModalEmojiSelector extends StatelessWidget {
  final Function(Emojis emoji) onTap;

  const ModalEmojiSelector({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 30,
      bottom: 90.0,
      child: SafeArea(
        child: Center(
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 8.0, 6.0, 8.0),
                  child: ModalEmojiSelectorButton(
                    emoji: 'assets/images/blueheart.png',
                    onTap: () => onTap(Emojis.blueheart),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
                  child: ModalEmojiSelectorButton(
                    emoji: 'assets/images/lol.png',
                    onTap: () => onTap(Emojis.lol),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
                  child: ModalEmojiSelectorButton(
                    emoji: 'assets/images/clap.png',
                    onTap: () => onTap(Emojis.clap),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
                  child: ModalEmojiSelectorButton(
                    emoji: 'assets/images/victory.png',
                    onTap: () => onTap(Emojis.victory),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 8.0, 12.0, 8.0),
                  child: ModalEmojiSelectorButton(
                    emoji: 'assets/images/waving.png',
                    onTap: () => onTap(Emojis.waving),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
