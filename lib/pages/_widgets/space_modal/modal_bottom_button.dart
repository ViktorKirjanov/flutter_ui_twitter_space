import 'package:flutter/material.dart';

class ModalBottomButton extends StatelessWidget {
  final IconData icondata;
  final bool isActive;
  final Function onTap;

  const ModalBottomButton({
    super.key,
    required this.icondata,
    this.isActive = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.grey.shade400,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              icondata,
              size: 20.0,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ),
          onTap: () => onTap(),
        ),
      ),
    );
  }
}
