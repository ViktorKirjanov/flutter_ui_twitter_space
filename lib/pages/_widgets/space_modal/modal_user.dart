import 'package:flutter/material.dart';

import '../../../core/enums/mic_status_enum.dart';
import '../../../core/models/user_model.dart';
import 'modal_user_avatar.dart';
import 'sound_indicator.dart';

class ModalUser extends StatelessWidget {
  final User user;

  const ModalUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ModalUserAvatar(user: user),
        const SizedBox(height: 8.0),
        Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user.micStatus == MicStatus.muted)
              Icon(
                Icons.mic_off_outlined,
                color: Colors.red.shade700,
                size: 14.0,
              ),
            if (user.micStatus == MicStatus.speaking) const SoundIndicator(),
            const SizedBox(width: 4.0),
            Text(
              user.role,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
