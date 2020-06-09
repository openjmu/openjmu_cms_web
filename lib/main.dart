///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/08 23:28
///
import 'package:flutter/material.dart';
import 'package:openjmu_cms_web/openjmu_cms_web_route_helper.dart';

import 'constants/constants.dart';
import 'pages/no_route_page.dart';
import 'pages/routes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: defaultColor.swatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.windows: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: RoutesPage(),
      navigatorObservers: <NavigatorObserver>[FFNavigatorObserver()],
      onGenerateRoute: (RouteSettings settings) => onGenerateRouteHelper(
        settings,
        notFoundFallback: NoRoutePage(route: settings.name),
      ),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
