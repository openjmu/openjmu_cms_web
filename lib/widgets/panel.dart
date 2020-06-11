///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/6/11 18:01
///
import 'package:flutter/material.dart';

import 'package:openjmu_cms_web/constants/constants.dart';

class Panel extends StatelessWidget {
  const Panel({
    Key key,
    this.title = 'Panel',
    this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(
              title,
              style: context.themeData.textTheme.headline6,
            ),
          ),
          Container(
            height: 1.0,
            color: context.themeData.primaryColor,
          ),
          child,
        ],
      ),
    );
  }
}
