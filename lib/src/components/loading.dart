import 'package:flutter/material.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationProps { x, y }

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = TimelineTween<AnimationProps>()
      ..addScene(
              begin: Duration.zero, duration: const Duration(milliseconds: 800))
          .animate(AnimationProps.y, tween: Tween(begin: 0.0, end: -25.0))
      ..addScene(
              begin: Duration.zero, duration: const Duration(milliseconds: 800))
          .animate(AnimationProps.y, tween: Tween(begin: -25.0, end: 0.0));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MirrorAnimation<TimelineValue<AnimationProps>>(
          tween: tween, // Pass in tween
          duration: tween.duration,
          curve: Curves.ease,
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(0, value.get(AnimationProps.y)),
              child: child,
            );
          },
          child: Image.asset(
            ImageConstants().randomHeroIcon(),
            height: 80,
          ),
        ),
        CustomAnimation<TimelineValue<AnimationProps>>(
          control: CustomAnimationControl.mirror,
          delay: const Duration(milliseconds: 200),
          tween: tween, // Pass in tween
          duration: tween.duration,
          curve: Curves.ease,
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(0, value.get(AnimationProps.y)),
              child: child,
            );
          },
          child: Image.asset(
            ImageConstants().randomMiniIcon(),
            height: 80,
          ),
        ),
        CustomAnimation<TimelineValue<AnimationProps>>(
          control: CustomAnimationControl.mirror,
          delay: const Duration(milliseconds: 600),
          tween: tween, // Pass in tween
          duration: tween.duration,
          curve: Curves.ease,
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(0, value.get(AnimationProps.y)),
              child: child,
            );
          },
          child: Image.asset(
            ImageConstants().randomMiniIcon(),
            height: 80,
          ),
        ),
      ],
    );
  }
}
