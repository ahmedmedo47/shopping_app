import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/features/splash/features/presentation/views/widgets/sliding_text.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation <Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();

  }

  // single responsibility principle  مبدئ ان كل فانكشن او كلاس مسؤولين عن حاجه معينخ
  void navigateToHome() {
    Future.delayed(const Duration(seconds:6),(){
      // Get.to(()=> const HomeView(),transition: Transition.fadeIn,duration: kTransitionDuration);
      Navigator.of(context).pushReplacementNamed("navigationBar");
    });
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
     // mainAxisAlignment: MainAxisAlignment.center,
     // crossAxisAlignment: CrossAxisAlignment.stretch,//بيسنتر العرض بتاع الايميج
      children: [
        const SizedBox(height: 130,),
        Center(
          child: SizedBox(
            width: 380, height: 400,
            child:Lottie.asset("assets/images/Animation - shopping2.json",fit: BoxFit.fill) ,),
        ),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }
  void initSlidingAnimation() {
    animationController = AnimationController(vsync:this,duration:const Duration(seconds: 3));
    slidingAnimation = Tween<Offset>(begin:const Offset(0,9) , end:const Offset(0,3)).animate(animationController);
    super.initState();
    animationController.forward();
  }
}
