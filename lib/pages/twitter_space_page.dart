import 'package:flutter/material.dart';

import '_widgets/space_modal/space_modal.dart';
import '_widgets/mic_animation.dart';

class TwitterSpacePage extends StatefulWidget {
  const TwitterSpacePage({super.key});

  @override
  State<TwitterSpacePage> createState() => _TwitterSpacePageState();
}

class _TwitterSpacePageState extends State<TwitterSpacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MicAnimation(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => const SpaceModal(),
                );
              },
            ),
            const Text('Tap to open'),
          ],
        ),
      ),
    );
  }
}
