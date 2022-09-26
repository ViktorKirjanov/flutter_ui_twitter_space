import 'package:flutter/material.dart';

class ModalRequestButton extends StatelessWidget {
  const ModalRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.grey.shade400,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
            width: 60,
            height: 60,
            child: Icon(
              Icons.mic,
              size: 32.0,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ),
    );
  }
}
