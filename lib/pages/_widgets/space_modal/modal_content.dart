import 'package:flutter/material.dart';

import '../../../core/data/users.dart';
import 'modal_user.dart';

class ModalContent extends StatelessWidget {
  const ModalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        childAspectRatio: 0.65,
        crossAxisCount: 4,
        children: List.generate(
          UserData.getUsers().length,
          (index) => ModalUser(user: UserData.getUsers()[index]),
        ),
      ),
    );
  }
}
