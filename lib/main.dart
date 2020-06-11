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
            TargetPlatform.android: FadeTransitionBuilder(),
            TargetPlatform.macOS: FadeTransitionBuilder(),
            TargetPlatform.windows: FadeTransitionBuilder(),
          },
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          context.themeData.textTheme,
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

class FadeTransitionBuilder extends PageTransitionsBuilder {
  /// Construct a [FadeTransitionBuilder].
  const FadeTransitionBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}