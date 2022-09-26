import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocks/messages_bloc/messages_bloc.dart';
import '../../../core/models/user_model.dart';

class ModalUserAvatar extends StatefulWidget {
  final User user;

  const ModalUserAvatar({super.key, required this.user});

  @override
  State<ModalUserAvatar> createState() => _ModalUserAvatarState();
}

class _ModalUserAvatarState extends State<ModalUserAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  String? emoji;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _animation =
        Tween<double>(begin: 0.0, end: 70.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(const Duration(milliseconds: 500), () {
                if (mounted) {
                  _animationController.reverse();
                }
              });
            }
          });
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/${widget.user.img}.jpeg',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          BlocBuilder<MessagesBloc, MessagesState>(
            bloc: BlocProvider.of<MessagesBloc>(context),
            buildWhen: (_, current) {
              if (current is CompleteMessagesState &&
                  current.emojiMessage.uid == widget.user.uid) {
                _animationController.forward();
                emoji = 'assets/images/${current.emojiMessage.emoji.name}.png';
                return true;
              }
              return false;
            },
            builder: (context, state) {
              return emoji != null
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: ClipOval(
                          child: Container(
                            width: _animation.value,
                            height: _animation.value,
                            padding: const EdgeInsets.all(12.0),
                            color: Colors.white,
                            child: Image.asset(
                              emoji!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}
