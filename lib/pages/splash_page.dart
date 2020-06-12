///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/6/12 15:43
///
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:openjmu_cms_web/constants/constants.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((Duration _) {
      navigate();
    });
  }

  void navigate() {
    Future<void>.delayed(2.seconds, () {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.canvasColor,
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            R.ASSETS_LOGO_1024_ROUNDED_PNG,
            width: 120.0,
          ),
        ),
      ),
    );
  }
}
