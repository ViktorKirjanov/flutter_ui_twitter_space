import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalCommentsButton extends StatelessWidget {
  const ModalCommentsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(25.0),
        splashColor: Colors.blue.withOpacity(0.4),
        child: Ink(
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade700,
                Colors.purple.shade300,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [
                0.5,
                1.0,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.white,
                  size: 18.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  '4',
                  style: TextStyle(
                    color: Colors.white,
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
