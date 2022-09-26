import 'package:flutter/material.dart';

class ModalTopMenu extends StatelessWidget {
  const ModalTopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.more_horiz,
                  size: 32.0,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 15),
              const Text(
                'Leave',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
