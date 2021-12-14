import 'package:flutter/material.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { x, y }

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = TimelineTween<AniProps>()
      ..addScene(
              begin: Duration.zero, duration: const Duration(milliseconds: 800))
          .animate(AniProps.y, tween: Tween(begin: 0.0, end: -25.0))
      ..addScene(
              begin: Duration.zero, duration: const Duration(milliseconds: 800))
          .animate(AniProps.y, tween: Tween(begin: -25.0, end: 0.0));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MirrorAnimation<TimelineValue<AniProps>>(
          tween: tween, // Pass in tween
          duration: tween.duration,
          curve: Curves.ease,
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(0, value.get(AniProps.y)),
              child: child,
            );
          },
          child: Image.asset(
            ImageConstants.iconBowler,
            height: 80,
          ),
        ),
        CustomAnimation<TimelineValue<AniProps>>(
          control: CustomAnimationControl.mirror,
          delay: const Duration(milliseconds: 200),
          tween: tween, // Pass in tween
          duration: tween.duration,
          curve: Curves.ease,
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(0, value.get(AniProps.y)),
              child: child,
            );
          },
          child: Image.asset(
            ImageConstants.iconMiner,
            height: 80,
          ),
        ),
        CustomAnimation<TimelineValue<AniProps>>(
          control: CustomAnimationControl.mirror,
          delay: const Duration(milliseconds: 600),
          tween: tween, // Pass in tween
          duration: tween.duration,
          curve: Curves.ease,
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(0, value.get(AniProps.y)),
              child: child,
            );
          },
          child: Image.asset(
            ImageConstants.iconElectroWizard,
            height: 80,
          ),
        ),
      ],
    );
  }
}
