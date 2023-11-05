import 'dart:async';
import 'package:arrahikulmakhtoom/pages/home_page.dart';
import 'package:arrahikulmakhtoom/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPageRoute route =
      MaterialPageRoute(builder: (builder) => const SplashScreen());
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double turns = 0.0;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animationController.forward();
    animationController.addListener(() {
      if (animationController.isCompleted) {
        Navigator.pushReplacement(context, Homepage.route);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 500), () {
      _activateSpinner();
    });
    Utils().loadContent(context);
    Utils().getSetting(context);
    return Scaffold(
        body: Stack(
      children: [
        _background(),
        _foreground(context),
      ],
    ));
  }

  Widget _background() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Image.asset('assets/images/splashScreen/topdesign.png')),
        Expanded(child: Image.asset('assets/images/splashScreen/bg.png')),
        Expanded(child: Image.asset('assets/images/splashScreen/mosque.png')),
      ],
    );
  }

  Widget _foreground(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController,
            child: SizedBox(
              height: 150.0,
              width: 150.0,
              child: Image.asset('assets/images/splashScreen/logo.png'),
            ),
            builder: (BuildContext context, Widget? widget) {
              return Transform.rotate(
                angle: animationController.value * 2,
                child: widget,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/splashScreen/theummah.png',
            width: 200,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _activateSpinner() {
    if (mounted) {
      setState(() {
        turns = .3;
      });
    }
    return Container();
  }
}
