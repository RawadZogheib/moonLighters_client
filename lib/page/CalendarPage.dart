import 'package:flutter/material.dart';
import 'package:flutter_client/globals/globals.dart' as globals;
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final calendarController = CleanCalendarController(
    initialDateSelected: DateTime.now(),
    minDate: DateTime.now().subtract(const Duration(days: 90)),
    maxDate: DateTime.now().add(const Duration(days: 90)),
    rangeMode: false,
    onDayTapped: (date) {},
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    // endDateSelected: DateTime(2022, 2, 3),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              _back();
            }),
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Calender',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              color: globals.whiteBlue,
              child: ScrollableCleanCalendar(
                calendarController: calendarController,
                layout: Layout.DEFAULT,
                calendarCrossAxisSpacing: 4,
                scrollController: ScrollController(
                    initialScrollOffset: MediaQuery.of(context).size.height*1.4,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  _back() {
    Navigator.pop(context);
  }
}
