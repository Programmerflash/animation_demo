import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstAnimationPage extends StatefulWidget {
  const FirstAnimationPage({Key? key}) : super(key: key);

  @override
  State<FirstAnimationPage> createState() => _FirstAnimationPageState();
}

class _FirstAnimationPageState extends State<FirstAnimationPage>
    with TickerProviderStateMixin {
  bool isAnimated = true;
  late AnimationController boxController;
  late Animation<double> boxAnimation;
  late AnimationController bulletController;
  late Animation<Offset> bulletAnimation;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 10), () {
      isAnimated = false;
      setState(() {});
    });
    boxController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200))
          ..forward();
    boxAnimation =
        CurvedAnimation(parent: boxController, curve: Curves.bounceInOut);
    bulletController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    bulletAnimation =
        Tween<Offset>(begin: Offset(2.5, 0.5), end: Offset(2.5, 10))
            .animate(bulletController);
    bulletController.forward().whenComplete(() {
      bulletController.repeat();
    });
    super.initState();
  }

  @override
  void dispose() {
    boxController.dispose();
    bulletController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 600),
                      color: Colors.amber,
                      height: isAnimated ? 0 : 200,
                      width: isAnimated ? 0 : 200,
                      curve: Curves.bounceInOut,
                    ),
                  ),
                  FadeTransition(
                    opacity: boxAnimation,
                    child: Container(
                      color: Colors.amber,
                      height: isAnimated ? 0 : 200,
                      width: isAnimated ? 0 : 200,
                    ),
                  ),
                ],
              ),
            ),
            SlideTransition(
                position: bulletAnimation,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blueGrey),
                  height: 70,
                  width: 70,
                )),
          ],
        ),
      ),
    );
  }
}
