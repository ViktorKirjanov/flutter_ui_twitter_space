import 'package:flutter/material.dart';

class MicAnimation extends StatefulWidget {
  final double? size;
  final Function? onTap;

  const MicAnimation({
    Key? key,
    this.size = 50,
    this.onTap,
  }) : super(key: key);

  @override
  State<MicAnimation> createState() => _MicAnimationState();
}

class _MicAnimationState extends State<MicAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController glowingCircle;

  @override
  void initState() {
    super.initState();

    glowingCircle = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: false);
  }

  @override
  void dispose() {
    glowingCircle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap != null ? () => widget.onTap!() : null,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          children: [
            ...List.generate(
              3,
              (index) {
                return FadeTransition(
                  opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                    CurvedAnimation(
                      parent: glowingCircle,
                      curve: Interval(
                        index * 0.2,
                        (index * 0.2 + 0.6),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 1.0, end: 2.0).animate(
                      CurvedAnimation(
                        parent: glowingCircle,
                        curve: Interval(
                          index * 0.2,
                          (index * 0.2 + 0.6),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.mic_rounded,
                  color: Colors.white,
                  size: widget.size,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
