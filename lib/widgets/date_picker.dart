///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/6/12 11:41
///
import 'package:flutter/material.dart';

import 'package:openjmu_cms_web/constants/constants.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key key,
    @required this.dateTime,
  })  : assert(dateTime != null),
        super(key: key);

  final DateTime dateTime;

  static Future<DateTime> show({
    Key key,
    @required BuildContext context,
    @required DateTime dateTime,
  }) {
    assert(dateTime != null);
    final Widget picker = DatePicker(
      key: key,
      dateTime: dateTime,
    );
    return showDialog<DateTime>(
      context: context,
      builder: (BuildContext _) => picker,
    );
  }

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = widget.dateTime;
  }

  void selectDateTime(DateTime day) {
    if (selectedDateTime == day) {
      return;
    }
    setState(() {
      selectedDateTime = day;
    });
  }

  Widget get currentDateIndicator => Container(
        width: double.maxFinite,
        height: 120.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        color: context.themeData.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DateFormat('yyyy').format(selectedDateTime),
              style: TextStyle(
                color: Colors.white.withOpacity(.5),
                fontSize: 20.0,
              ),
            ),
            Expanded(
              child: Text(
                DateFormat.MMMEd('zh-CN').format(selectedDateTime),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

  Widget get actionBar => Theme(
        data: context.themeData.copyWith(
          buttonTheme: const ButtonThemeData(
            minWidth: 80.0,
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: Icon(
                    Icons.clear,
                    color: context.themeData.colorScheme.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(selectedDateTime);
                  },
                  icon: Icon(
                    Icons.check,
                    color: context.themeData.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 420.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: ColoredBox(
              color: context.themeData.colorScheme.surface,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  currentDateIndicator,
                  CalendarDatePicker(
                    initialDate: widget.dateTime,
                    firstDate: DateTime.now() - 365.days,
                    lastDate: DateTime.now() + 365.days,
                    onDateChanged: selectDateTime,
                    selectableDayPredicate: (DateTime day) {
                      return day.weekday == DateTime.monday;
                    },
                  ),
                  actionBar,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
