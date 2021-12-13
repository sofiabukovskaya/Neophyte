import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../data/models/interview.dart';
import '../data/providers/interfaces/i_interview_provider.dart';
import '../utils/constants.dart';

class CalendarControllerGetx extends GetxController {
  List<Interview> interviews = [];
  final interviewProvider = Get.find<IInterviewProvider>();
  String nameCandidate = '';

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
          interview.id,
          interview.candidateId,
          'Meeting',
          DateFormat("yyyy-MM-dd hh:mm").parse(
              interview.interviewTime.replaceAll('Z', '').replaceAll('T', ' ')),
          DateTime(2021, 11, 1, 10, 0),
          interview.link,
          const Color(0xFF0F8644),
          true));
    }
    return meetings;
  }

  void updateMeeting(
      int id, String link, DateTime datetime, int candidateId) async {
    await interviewProvider
        .updateInterview(id, link, datetime, candidateId)
        .then((value) async {
      if (value) {
        openAndCloseLoadingDialog();
        await Future.delayed(const Duration(seconds: 3));
        await interviewProvider
            .getListInterviews()
            .then((value) => interviews = value);
        refresh();
        Navigator.of(Get.overlayContext!).pop();
        Get.dialog(
          AlertDialog(
            title: const Text('Interviews data update successfully!',
                style: TextStyle(fontFamily: 'avenir')),
            actions: <Widget>[
              TextButton(
                child:
                    const Text('Close', style: TextStyle(fontFamily: 'avenir')),
                onPressed: () {
                  Get.close(3);
                },
              )
            ],
          ),
          barrierDismissible: false,
        );
      } else {
        openAndCloseLoadingDialog();
        await Future.delayed(const Duration(seconds: 3));
        Navigator.of(Get.overlayContext!).pop();
        Get.dialog(
          AlertDialog(
            title: const Text('Something gone wrong :(',
                style: TextStyle(fontFamily: 'avenir')),
            actions: <Widget>[
              TextButton(
                child:
                    const Text('Close', style: TextStyle(fontFamily: 'avenir')),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ),
          barrierDismissible: false,
        );
      }
    });
  }

  Future<void> openAndCloseLoadingDialog() async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Constants.mainLightColor),
            ),
          ),
        ),
      ),
    );
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
  int? id;
  int? candidateId;
  String eventName;
  DateTime from;
  DateTime to;
  String? link;
  Color background;
  bool isAllDay;

  // ignore: sort_constructors_first
  Meeting(this.id, this.candidateId, this.eventName, this.from, this.to,
      this.link, this.background, this.isAllDay);

  // ignore: sort_constructors_first
  factory Meeting.test(int day) {
    return Meeting(
      1,
      12,
      'Daria Koshkina',
      DateTime(2021, 11, day, 9, 0),
      DateTime(2021, 11, day, 10, 0),
      'example.com',
      const Color(0xFF0F8644),
      true,
    );
  }
}
