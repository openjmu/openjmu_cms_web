///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/08 23:28
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openjmu_cms_web/openjmu_cms_web_route_helper.dart';
import 'package:openjmu_cms_web/pages/splash_page.dart';

import 'constants/constants.dart';
import 'pages/no_route_page.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
  InputUtils.hideKeyboard();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: defaultTheme(context),
      child: OKToast(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: defaultTheme(context),
          home: SplashPage(),
          navigatorObservers: <NavigatorObserver>[FFNavigatorObserver()],
          onGenerateRoute: (RouteSettings settings) => onGenerateRouteHelper(
            settings,
            notFoundFallback: NoRoutePage(route: settings.name),
          ),
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
        ),
      ),
    );
  }
}
