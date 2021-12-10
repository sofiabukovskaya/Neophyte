import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/calendar_controller.dart';

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
            return Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.amber.shade100, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(meetings[index].eventName,
                        style: const TextStyle(
                            fontFamily: 'avenir', fontSize: 16)),
                    const SizedBox(height: 10.0),
                    Text(meetings[index].from.toString(),
                        style: const TextStyle(
                            fontFamily: 'avenir', fontSize: 16)),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Link meeting: ',
                      style: TextStyle(fontFamily: 'avenir', fontSize: 16),
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: () => launch(meetings[index].link),
                      child: Text(meetings[index].link,
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                          style: const TextStyle(
                              fontFamily: 'avenir',
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 16)),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
