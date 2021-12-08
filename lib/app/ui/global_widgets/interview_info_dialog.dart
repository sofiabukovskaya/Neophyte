import 'package:flutter/material.dart';
import '../pages/home_page/tabs/calendar_tab.dart';

class InterviewInfoDialog extends StatelessWidget {
  const InterviewInfoDialog({Key? key, required this.meetings})
      : super(key: key);

  final List<Meeting> meetings;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
          shrinkWrap: true,
          itemCount: meetings.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(meetings[index].eventName),
                  const SizedBox(height: 10.0),
                  Text(meetings[index].from.toString()),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
