import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_twitter_space/core/blocks/visibility_cubit/visibility_cubit.dart';

import 'modal_bottom_button.dart';
import 'modal_comments_button.dart';
import 'modal_request_button.dart';

class ModalBottomMenu extends StatelessWidget {
  const ModalBottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                ModalRequestButton(),
                SizedBox(height: 4.0),
                Text('Request', style: TextStyle(fontSize: 12.0)),
              ],
            ),
            Row(
              children: [
                ModalBottomButton(
                  icondata: Icons.people_outline,
                  onTap: () {},
                ),
                const SizedBox(width: 8.0),
                BlocBuilder<VisibilityCubit, bool>(
                  builder: (_, state) {
                    return ModalBottomButton(
                      icondata: CupertinoIcons.heart,
                      isActive: !state,
                      onTap: () =>
                          BlocProvider.of<VisibilityCubit>(context).change(),
                    );
                  },
                ),
                const SizedBox(width: 8.0),
                ModalBottomButton(
                  icondata: Icons.share_outlined,
                  onTap: () {},
                ),
                const SizedBox(width: 12.0),
                const ModalCommentsButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
