///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/6/11 16:16
///
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
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
      headers: <String, String>{
        'Authorization': 'Bearer 9RFKfZYjEFT8H1L5QDt7cUz74H3IUj5U',
      },
    ).then((ResponseModel<FirstDayModel> model) {
      this.model = model.data;
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
                          FlatButton(
                            onPressed: () async {
                              final DateTime result = await showRoundedDatePicker(
                                context: context,
                                initialDate: DateTime.parse('2020-06-08'),
                                borderRadius: 16,
                                selectableDayPredicate: (DateTime day) {
                                  return day.weekday == DateTime.monday;
                                }
                              );
                              print(result);
                            },
                            child: Text('Pick date'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          )
        : const Center(child: PlatformProgressIndicator());
  }
}
