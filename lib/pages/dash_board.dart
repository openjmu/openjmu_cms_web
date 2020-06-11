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
  double get headerHeight => 100.0;

  static const EntryItem dashBoardItem = EntryItem(
    icon: Icons.donut_small,
    title: 'Dashboard',
    name: 'My Dashboard',
    route: Routes.dashBoardHome,
  );

  List<EntryItem> get list => <EntryItem>[
        dashBoardItem,
        const EntryItem(title: 'Sections', isFixed: true),
        const EntryItem(
          icon: Icons.assignment,
          title: 'Announcement',
          name: 'Announcement Control',
          route: Routes.dashBoardHome,
        ),
        const EntryItem(
          icon: Icons.calendar_today,
          title: 'First Day Of Term',
          name: 'First Day Of Term Control',
          route: Routes.dashBoardFirstDayOfTerm,
        ),
      ];

  EntryItem selectedItem = dashBoardItem;

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
        height: headerHeight,
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
            const SizedBox(width: 20.0),
            Text(
              'OJ CMS',
              style: TextStyle(
                color: context.themeData.primaryColor,
                fontSize: 30.0,
                fontFamily: 'chocolate',
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
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
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            if (!isSelected) {
              setState(() {
                selectedItem = item;
              });
              Instances.frameNavigatorKey.currentState.pushReplacementNamed(item.route);
            }
          },
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
            child: Row(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Icon(
                    item.icon,
                    color: isSelected ? Colors.white : null,
                  ),
                ),
                const SizedBox(width: 15.0),
                Text(
                  item.title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : null,
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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.themeData.canvasColor,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: <Widget>[
              Container(
                width: 250.0,
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
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
                                  icon: Icon(Icons.toc),
                                  onPressed: () {},
                                ),
                                const Spacer(),
                                Text('Alex'),
                                const SizedBox(width: 10.0),
                                const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    R.ASSETS_LOGO_1024_ROUNDED_PNG,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
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
                      ),
                      Expanded(
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
                    ],
                  ),
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
    if (other.runtimeType != runtimeType) return false;
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
