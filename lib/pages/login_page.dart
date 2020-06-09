///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/09 20:18
///
import 'package:flutter/material.dart';

import 'package:openjmu_cms_web/constants/constants.dart';

@FFRoute(name: '/login', routeName: '登录页')
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          constraints: const BoxConstraints(
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
                size: const Size.square(100.0),
                child: Image.asset(R.ASSETS_LOGO_1024_ROUNDED_PNG),
              ),
              const Text(
                'OpenJmu',
                style: TextStyle(
                  color: defaultColor,
                  fontFamily: 'chocolate',
                  fontSize: 42.0,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                constraints: const BoxConstraints(
                  maxWidth: 100.0,
                ),
                height: 50.0,
                decoration: const BoxDecoration(
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
                      child: const SizedBox.expand(
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