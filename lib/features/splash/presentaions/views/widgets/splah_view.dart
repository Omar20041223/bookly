import 'package:booklyinsession/core/utils/styles.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidingText;
  late Animation<Offset> slidingImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimation();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, "homeScreen");
    });
  }

  void initAnimation() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingText = Tween<Offset>(begin: const Offset(.5 , 2),end: const Offset(.5 , -2.5)).animate(animationController);
    slidingImage = Tween<Offset>(begin: const Offset(.2, -2),end: const Offset(.2, -.1)).animate(animationController);
    animationController.forward();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff100B20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: slidingImage,
            child: Container(
              height: 200,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Logo.png")
                )
              ),
            ),
          ),
          SlideTransition(
            position: slidingText,
              child:
          const Text("BooklyApp",style: Styles.textStyle20))
        ],
      ),
    );
  }
}
