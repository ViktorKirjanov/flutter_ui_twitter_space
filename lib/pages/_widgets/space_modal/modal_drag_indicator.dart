import 'package:flutter/material.dart';

class ModalDragIndicator extends StatelessWidget {
  const ModalDragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: Container(
          height: 5.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
      ),
    );
  }
}
