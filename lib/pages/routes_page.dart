///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/09 20:23
///
import 'package:flutter/material.dart';
import 'package:openjmu_cms_web/constants/constants.dart';

@FFRoute(name: '/routes', routeName: '路由页')
class RoutesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 360.0,
            maxHeight: 360.0,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: routeNames.length,
            itemBuilder: (BuildContext _, int index) {
              final String name = routeNames[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(name);
                },
                child: Center(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
