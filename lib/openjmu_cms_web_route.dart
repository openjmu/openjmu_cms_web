// GENERATED CODE - DO NOT MODIFY MANUALLY
// **************************************************************************
// Auto generated by https://github.com/fluttercandies/ff_annotation_route
// **************************************************************************

import 'package:flutter/widgets.dart';

import 'pages/dash_board.dart';
import 'pages/home/first_day_page.dart';
import 'pages/home/home.dart';
import 'pages/login_page.dart';
import 'pages/routes_page.dart';

// ignore_for_file: argument_type_not_assignable
RouteResult getRouteResult({String name, Map<String, dynamic> arguments}) {
  switch (name) {
    case '/dash-board':
      return RouteResult(
        name: name,
        widget: DashBoard(),
        routeName: '控制台',
      );
    case '/dash-board/first-day-of-term':
      return RouteResult(
        name: name,
        widget: FirstDayPage(),
        routeName: '学期起始日',
      );
    case '/dash-board/home':
      return RouteResult(
        name: name,
        widget: FrameHomePage(),
        routeName: '总览',
      );
    case '/login':
      return RouteResult(
        name: name,
        widget: LoginPage(),
        routeName: '登录页',
      );
    case '/routes':
      return RouteResult(
        name: name,
        widget: RoutesPage(),
        routeName: '路由页',
      );
    default:
      return const RouteResult(name: 'flutterCandies://notfound');
  }
}

class RouteResult {
  const RouteResult({
    @required this.name,
    this.widget,
    this.showStatusBar = true,
    this.routeName = '',
    this.pageRouteType,
    this.description = '',
    this.exts,
  });

  /// The name of the route (e.g., "/settings").
  ///
  /// If null, the route is anonymous.
  final String name;

  /// The Widget return base on route
  final Widget widget;

  /// Whether show this route with status bar.
  final bool showStatusBar;

  /// The route name to track page
  final String routeName;

  /// The type of page route
  final PageRouteType pageRouteType;

  /// The description of route
  final String description;

  /// The extend arguments
  final Map<String, dynamic> exts;
}

enum PageRouteType {
  material,
  cupertino,
  transparent,
}
