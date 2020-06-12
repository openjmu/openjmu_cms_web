///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/09 22:44
///
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:openjmu_cms_web/constants/constants.dart';
import 'package:openjmu_cms_web/openjmu_cms_web_route_helper.dart';
import 'package:openjmu_cms_web/pages/no_route_page.dart';

@FFRoute(name: '/dash-board', routeName: '控制台')
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  static const EntryItem dashBoardItem = EntryItem(
    icon: Icons.donut_small,
    title: 'Dashboard',
    name: 'My Dashboard',
    route: Routes.dashBoardHome,
  );

  final Curve animateCurve = Curves.easeInOut;
  final Duration animateDuration = kTabScrollDuration;
  EntryItem selectedItem = dashBoardItem;
  bool isSideBarExpanded = true;

  double get headerHeight => 100.0;
  double get sideBarExpandWidth => 250.0;
  double get sideBarCollapsedWidth => 88.0;

  List<EntryItem> get list => <EntryItem>[
        dashBoardItem,
        const EntryItem(title: 'Sections', isFixed: true),
        const EntryItem(
          icon: Icons.assignment,
          title: 'Announcement',
          name: 'Announcement',
          route: Routes.dashBoardHome,
        ),
        const EntryItem(
          icon: Icons.calendar_today,
          title: 'First Day Of Term',
          name: 'First Day Of Term',
          route: Routes.dashBoardFirstDayOfTerm,
        ),
      ];

  @override
  void initState() {
    super.initState();
    isSideBarExpanded = Screens.width.isWideScreen;
  }

  double framePageWidthCalculation(bool isWideScreen) {
    if (isWideScreen) {
      return Screens.width - sideBarExpandWidth + (isSideBarExpanded ? 0.0 : sideBarCollapsedWidth);
    } else {
      return Screens.width - sideBarCollapsedWidth;
    }
  }

  Widget get headLogoWidget => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          color: context.themeData.primaryColor.withOpacity(0.1),
        ),
        height: headerHeight + Screens.topSafeHeight,
        child: Container(
          margin: EdgeInsets.only(top: Screens.topSafeHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.fromSize(
                size: const Size.square(48.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(R.ASSETS_LOGO_1024_ROUNDED_PNG),
                ),
              ),
              AnimatedContainer(
                curve: animateCurve,
                duration: animateDuration,
                width: isSideBarExpanded ? 20.0 : 0.0,
              ),
              AnimatedContainer(
                curve: animateCurve,
                duration: animateDuration,
                width: isSideBarExpanded ? 120.0 : 0.0,
                child: AnimatedOpacity(
                  curve: animateCurve,
                  duration: animateDuration,
                  opacity: isSideBarExpanded ? 1.0 : 0.0,
                  child: Text(
                    'OJ CMS',
                    style: TextStyle(
                      color: context.themeData.primaryColor,
                      fontSize: 30.0,
                      fontFamily: 'chocolate',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget entryItem(EntryItem item) {
    final bool isSelected = item == selectedItem;
    Widget itemContent;
    if (item.isFixed) {
      itemContent = Text(
        item.title,
        style: context.themeData.textTheme.caption,
      );
    } else {
      itemContent = ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          height: 40.0,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: <Color>[defaultColor, Colors.pink],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  )
                : null,
          ),
          child: MaterialButton(
            onPressed: () {
              if (!isSelected) {
                setState(() {
                  selectedItem = item;
                });
                Instances.frameNavigatorKey.currentState.pushReplacementNamed(item.route);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Icon(
                    item.icon,
                    color: isSelected ? Colors.white : null,
                  ),
                ),
                AnimatedContainer(
                  curve: animateCurve,
                  duration: animateDuration,
                  width: isSideBarExpanded ? 15.0 : 0.0,
                ),
                AnimatedContainer(
                  curve: animateCurve,
                  duration: animateDuration,
                  width: isSideBarExpanded ? sideBarExpandWidth - 75.0 : 0.0,
                  child: AnimatedOpacity(
                    curve: animateCurve,
                    duration: animateDuration,
                    opacity: isSideBarExpanded ? 1.0 : 0.0,
                    child: Text(
                      item.title,
                      style: TextStyle(
                        color: isSelected ? Colors.white : null,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: itemContent,
    );
  }

  Widget framePage(bool isWideScreen) => AnimatedContainer(
        curve: animateCurve,
        duration: animateDuration,
        width: framePageWidthCalculation(isWideScreen),
        padding: EdgeInsets.only(top: Screens.topSafeHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              frameHeader,
              frameSectionName,
              frameContent,
            ],
          ),
        ),
      );

  Widget get sideBar => AnimatedContainer(
        curve: animateCurve,
        duration: animateDuration,
        width: isSideBarExpanded ? sideBarExpandWidth : sideBarCollapsedWidth,
        height: double.maxFinite,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: context.themeData.primaryColorDark.withOpacity(0.01),
              blurRadius: 20.0,
              spreadRadius: 2.0,
            ),
          ],
          color: context.themeData.colorScheme.surface,
        ),
        child: Column(
          children: <Widget>[
            headLogoWidget,
            Expanded(
              child: Material(
                type: MaterialType.transparency,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  itemCount: list.length,
                  itemBuilder: (BuildContext _, int index) {
                    return entryItem(list[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Widget get frameHeader => Container(
        height: headerHeight,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: context.themeData.colorScheme.surface,
          shadowColor: Colors.grey[300],
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.toc),
                  onPressed: () {
                    setState(() {
                      isSideBarExpanded = !isSideBarExpanded;
                    });
                  },
                ),
                const Spacer(),
                const Text(
                  'Alex',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(width: 10.0),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    R.ASSETS_AVATAR_PLACEHOLDER_PNG,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      );

  Widget get frameSectionName => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            Text(
              selectedItem.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Widget get frameContent => Expanded(
        child: Theme(
          data: context.themeData.copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: NoTransitionBuilder(),
                TargetPlatform.fuchsia: NoTransitionBuilder(),
                TargetPlatform.iOS: NoTransitionBuilder(),
                TargetPlatform.linux: NoTransitionBuilder(),
                TargetPlatform.macOS: NoTransitionBuilder(),
                TargetPlatform.windows: NoTransitionBuilder(),
              },
            ),
          ),
          child: Material(
            type: MaterialType.transparency,
            child: Navigator(
              key: Instances.frameNavigatorKey,
              initialRoute: Routes.dashBoardHome,
              onGenerateRoute: (RouteSettings settings) {
                return onGenerateRouteHelper(
                  settings,
                  notFoundFallback: NoRoutePage(route: settings.name),
                );
              },
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = context.mediaQuery.size.width.isWideScreen;
    return Material(
      color: context.themeData.canvasColor,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: <Widget>[
              PositionedDirectional(
                start: 0.0,
                top: 0.0,
                bottom: 0.0,
                child: Row(
                  children: <Widget>[
                    sideBar,
                    framePage(isWideScreen),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

@immutable
class EntryItem {
  const EntryItem({
    this.icon,
    this.title,
    this.name,
    this.route,
    this.isFixed = false,
  });

  final IconData icon;
  final String title;
  final String name;
  final String route;
  final bool isFixed;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is EntryItem &&
        other.icon == icon &&
        other.title == title &&
        other.name == name &&
        other.route == route &&
        other.isFixed == isFixed;
  }

  @override
  int get hashCode => hashValues(icon, title, name, route, isFixed);
}

class NoTransitionBuilder extends PageTransitionsBuilder {
  /// Construct a [NoTransitionBuilder].
  const NoTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
