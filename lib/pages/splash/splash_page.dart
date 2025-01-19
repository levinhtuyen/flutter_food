import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/utils/dimensions.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState(){

    super.initState();
    controller = new AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2))..forward();
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear
    );
    Timer(
      Duration(seconds: 3),
        ()=>Get.offNamed(RouteHelper.getInitial())
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          ScaleTransition(
              scale: animation,
              child: Center(child: Image.asset("assets/images/logo part 1.png", width: Dimensions.splashImg,))
          ),
          Center(child: Image.asset("assets/images/logo part 2.png", width: Dimensions.splashImg,)),
        ],
      ),
    );
  }
}
