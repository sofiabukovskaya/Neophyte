import 'package:flutter/material.dart';
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
}
