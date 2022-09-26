import 'package:flutter/material.dart';

class ModalEmojiSelectorButton extends StatefulWidget {
  final String emoji;
  final Function onTap;

  const ModalEmojiSelectorButton({
    super.key,
    required this.emoji,
    required this.onTap,
  });

  @override
  State<ModalEmojiSelectorButton> createState() =>
      MModalEmojiSelectorButtonState();
}

class MModalEmojiSelectorButtonState extends State<ModalEmojiSelectorButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        widget.emoji,
      ),
      onTap: () => widget.onTap(),
    );
  }
}
