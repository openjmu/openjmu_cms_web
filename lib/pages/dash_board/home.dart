///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/09 22:44
///
import 'package:flutter/material.dart';
import 'package:openjmu_cms_web/constants/constants.dart';

@FFRoute(name: '/dash-board', routeName: '控制台')
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<EntryItem> get list => <EntryItem>[
        const EntryItem(
          icon: Icons.title,
          title: 'test',
          route: 'route',
        ),
        const EntryItem(
          icon: Icons.title,
          title: 'test 1',
          route: 'route',
        ),
        const EntryItem(
          icon: Icons.title,
          title: 'test 2',
          route: 'route',
        ),
      ];

  EntryItem selectedItem;

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
        height: 60.0,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: Image.asset(R.ASSETS_LOGO_1024_ROUNDED_PNG),
            ),
            Expanded(
              child: Text(
                'OJ CMS',
                style: TextStyle(
                  color: context.themeData.primaryColor,
                  fontSize: 30.0,
                  fontFamily: 'chocolate',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      );

  Widget entryItem(EntryItem item) {
    final bool isSelected = item == selectedItem;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            if (!isSelected) {
              setState(() {
                selectedItem = item;
              });
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
                const SizedBox(width: 20.0),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.themeData.dividerColor,
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
                      color:
                          context.themeData.primaryColorDark.withOpacity(0.01),
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
              const Expanded(
                child: SizedBox.shrink(),
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
    this.route,
  });

  final IconData icon;
  final String title;
  final String route;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType)
      return false;
    return other is EntryItem &&
        other.icon == icon &&
        other.title == title &&
        other.route == route;
  }

  @override
  int get hashCode => hashValues(icon, title, route);
}
