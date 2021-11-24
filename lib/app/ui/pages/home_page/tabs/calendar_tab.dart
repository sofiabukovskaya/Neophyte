import 'package:flutter/material.dart';
import 'package:neophyte/app/ui/global_widgets/interview_info_dialog.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../utils/constants.dart';

class CalendarTab extends StatefulWidget {
  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: SfCalendar(
        onTap: (details) {
          if (_getDataSource()
              .where(
                (e) =>
                    e.from.year == details.date?.year &&
                    e.from.month == details.date?.month &&
                    e.from.day == details.date?.day,
              )
              .toList()
              .isNotEmpty){
            showBottomSheet(
              context: context,
              builder: (context) => InterviewInfoDialog(
                meetings: _getDataSource()
                    .where(
                      (e) =>
                          e.from.year == details.date?.year &&
                          e.from.month == details.date?.month &&
                          e.from.day == details.date?.day,
                    )
                    .toList(),
              ),
            );
          }

        },
        dataSource: MeetingDataSource(_getDataSource()),
        view: CalendarView.month,
        showNavigationArrow: true,
        headerHeight: 80,
        todayHighlightColor: Constants.mainColor,
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Constants.mainLightColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[
      Meeting.test(2),
      Meeting.test(5),
      Meeting.test(6),
      Meeting.test(6),
      Meeting.test(6),
      Meeting.test(7),
      Meeting.test(8),
      Meeting.test(9),
      Meeting.test(12),
    ];
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

  // ignore: sort_constructors_first
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  factory Meeting.test(int day) {
    return Meeting(
      'Daria Koshkina',
      DateTime(2021, 11, day, 9, 0),
      DateTime(2021, 11, day, 9, 15),
      const Color(0xFF0F8644),
      true,
    );
  }
}
