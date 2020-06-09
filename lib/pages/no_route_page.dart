///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/09 20:32
///
import 'package:flutter/material.dart';

class NoRoutePage extends StatelessWidget {
  const NoRoutePage({this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'You\'re visiting $route route which result nothing...',
        ),
      ),
    );
  }
}
