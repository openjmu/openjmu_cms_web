///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/08 23:28
///
import 'package:flutter/material.dart';

import 'constants/constants.dart';

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color:
                    context.themeData.colorScheme.background.withOpacity(0.5),
                blurRadius: 30.0,
                spreadRadius: 0.0,
              ),
            ],
            borderRadius: BorderRadius.circular(30.0),
            color: context.themeData.colorScheme.surface,
          ),
          constraints: BoxConstraints(
            maxWidth: 460.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 50.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox.fromSize(
                size: Size.square(100.0),
                child: Image.asset(R.ASSETS_LOGO_1024_ROUNDED_PNG),
              ),
              Text(
                'OpenJmu',
                style: TextStyle(
                  color: defaultColor,
                  fontFamily: "chocolate",
                  fontSize: 42.0,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                constraints: BoxConstraints(
                  maxWidth: 100.0,
                ),
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: maxBorderRadius,
                  gradient: LinearGradient(
                    colors: <Color>[defaultColor, Colors.pink],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: maxBorderRadius,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        HttpUtils.fetch(
                          FetchType.get,
                          url: API.login,
                        ).then((ResponseModel<dynamic> model) {
                          print(model);
                        });
                      },
                      child: SizedBox.expand(
                        child: Center(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
