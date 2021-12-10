import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../data/models/interview.dart';
import '../data/providers/interfaces/i_interview_provider.dart';

class CalendarControllerGetx extends GetxController {
  List<Interview> interviews = [];
  final interviewProvider = Get.find<IInterviewProvider>();

  void onInit() async {
    super.onInit();
    await interviewProvider
        .getListInterviews()
        .then((value) => interviews = value);
  }

  List<Meeting> getDataSource() {
    final List<Meeting> meetings = [];

    for (Interview interview in interviews) {
      meetings.add(Meeting(
          'Candidate name',
          DateFormat("yyyy-MM-dd hh:mm").parse(
              interview.interviewTime.replaceAll('Z', '').replaceAll('T', ' ')),
          DateTime(2021, 11, 1, 10, 0),
          interview.link,
          const Color(0xFF0F8644),
          true));
    }
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
  String link;
  Color background;
  bool isAllDay;

  // ignore: sort_constructors_first
  Meeting(this.eventName, this.from, this.to, this.link, this.background,
      this.isAllDay);

  // ignore: sort_constructors_first
  factory Meeting.test(int day) {
    return Meeting(
      'Daria Koshkina',
      DateTime(2021, 11, day, 9, 0),
      DateTime(2021, 11, day, 10, 0),
      'example.com',
      const Color(0xFF0F8644),
      true,
    );
  }
}
