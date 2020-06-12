///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/6/11 16:16
///
import 'package:flutter/material.dart';

import 'package:openjmu_cms_web/constants/constants.dart';

@FFRoute(name: '/dash-board/first-day-of-term', routeName: '学期起始日')
class FirstDayPage extends StatefulWidget {
  @override
  _FirstDayPageState createState() => _FirstDayPageState();
}

class _FirstDayPageState extends State<FirstDayPage> {
  FirstDayModel model;

  @override
  void initState() {
    super.initState();
    HttpUtils.fetch<FirstDayModel>(
      FetchType.get,
      url: API.firstDay,
      queryParameters: <String, String>{'type': ''},
    ).then((ResponseModel<FirstDayModel> model) {
      if (model.data != null) {
        this.model = model.data;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return model != null
        ? Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Panel(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.themeData.dividerColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                final DateTime result = await DatePicker.show(
                                  context: context,
                                  dateTime: DateTime.parse(model.value),
                                );
                                if (result != null) {
                                  model.value = DateFormat('yyyy-MM-dd').format(result);
                                  if (mounted) {
                                    setState(() {});
                                  }
                                }
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox.fromSize(
                                    size: const Size.square(50.0),
                                    child: const Icon(Icons.date_range),
                                  ),
                                  Expanded(
                                    child: Text(
                                      model.value,
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                width: double.maxFinite,
                                height: 40.0,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[defaultColor, Colors.pink],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    showToastWidget(
                                      Material(
                                        color: Colors.black38,
                                        child: Center(
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: context.themeData.colorScheme.surface,
                                              boxShadow: null,
                                            ),
                                            child: const Center(
                                              child: CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      handleTouch: true,
                                    );
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
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
                  if (context.mediaQuery.size.width.isWideScreen) const Spacer(),
                ],
              ),
            ],
          )
        : const Center(child: PlatformProgressIndicator());
  }
}
