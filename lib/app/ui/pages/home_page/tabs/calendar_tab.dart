import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../controllers/calendar_controller.dart';
import '../../../../utils/constants.dart';
import '../../../global_widgets/interview_info_dialog.dart';

class CalendarTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarControllerGetx>(
        init: CalendarControllerGetx(),
        builder: (controller) => Container(
              padding: const EdgeInsets.only(top: 20),
              child: SfCalendar(
                onTap: (details) {
                  if (controller
                      .getDataSource()
                      .where(
                        (e) =>
                            e.from.year == details.date?.year &&
                            e.from.month == details.date?.month &&
                            e.from.day == details.date?.day,
                      )
                      .toList()
                      .isNotEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: SizedBox(
                                height: 250,
                                width: 200,
                                child: SingleChildScrollView(
                                  child: InterviewInfoDialog(
                                    meetings: controller
                                        .getDataSource()
                                        .where(
                                          (e) =>
                                              e.from.year ==
                                                  details.date?.year &&
                                              e.from.month ==
                                                  details.date?.month &&
                                              e.from.day == details.date?.day,
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Close',
                                      style: TextStyle(fontFamily: 'avenir')),
                                  onPressed: () {
                                    Get.back();
                                  },
                                )
                              ],
                            ));
                  }
                },
                dataSource: MeetingDataSource(controller.getDataSource()),
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
            ));
  }
}
