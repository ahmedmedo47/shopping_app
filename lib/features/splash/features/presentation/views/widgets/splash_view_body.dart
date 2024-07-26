import 'package:flutter/material.dart';
import 'package:shopping_app/features/splash/features/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with TickerProviderStateMixin {
  late AnimationController imageAnimationController;
  late AnimationController textAnimationController;
  late Animation<Offset> imageSlidingAnimation;
  late Animation<Offset> textSlidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimations();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 9), () {
      Navigator.of(context).pushReplacementNamed("navigationBar");
    });
  }

  @override
  void dispose() {
    imageAnimationController.dispose();
    textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlideTransition(
          position: imageSlidingAnimation,
          child: Image.asset("assets/images/shopping_photo.jpg"),
        ),
        const SizedBox(height: 10),
        SlideTransition(
          position: textSlidingAnimation,
          child: SlidingText(slidingAnimation: textSlidingAnimation),
        ),
      ],
    );
  }

  void initSlidingAnimations() {
    imageAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    textAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    imageSlidingAnimation = Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
        parent: imageAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    textSlidingAnimation = Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(
      CurvedAnimation(
        parent: textAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    imageAnimationController.forward().then((_) {
      textAnimationController.forward();
    });
  }
}
