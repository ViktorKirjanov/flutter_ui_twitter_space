import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_twitter_space/core/blocks/visibility_cubit/visibility_cubit.dart';
import 'package:flutter_ui_twitter_space/pages/_widgets/space_modal/modal_top_menu.dart';

import '../../../core/blocks/messages_bloc/messages_bloc.dart';
import 'modal_bottom_menu.dart';
import 'modal_content.dart';
import 'modal_drag_indicator.dart';
import 'modal_emoji_selector.dart';
import 'modal_title.dart';

class SpaceModal extends StatefulWidget {
  const SpaceModal({Key? key}) : super(key: key);

  @override
  State<SpaceModal> createState() => _SpaceModalState();
}

class _SpaceModalState extends State<SpaceModal> {
  late MessagesBloc _messagesBloc;
  late VisibilityCubit _visibilityCubit;

  @override
  void initState() {
    super.initState();
    _messagesBloc = MessagesBloc()..add(InitRandomMessagesEvent());
    _visibilityCubit = VisibilityCubit();
  }

  @override
  void dispose() {
    _messagesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ModalDragIndicator(),
              const ModalTopMenu(),
              const ModalTitle(),
              BlocProvider.value(
                value: _messagesBloc,
                child: const ModalContent(),
              ),
              const Divider(height: 1.0),
              BlocProvider.value(
                value: _visibilityCubit,
                child: const ModalBottomMenu(),
              ),
            ],
          ),
          BlocBuilder<VisibilityCubit, bool>(
            bloc: _visibilityCubit,
            builder: (_, state) {
              return state
                  ? ModalEmojiSelector(
                      onTap: (emoji) {
                        _visibilityCubit.hide();
                        _messagesBloc.add(AddMessagesEvent(emoji));
                      },
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}
