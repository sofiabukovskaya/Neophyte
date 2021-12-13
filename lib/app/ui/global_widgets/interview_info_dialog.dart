import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/calendar_controller.dart';
import '../../utils/constants.dart';

class InterviewInfoDialog extends StatefulWidget {
  InterviewInfoDialog(
      {Key? key, required this.meetings, required this.updateMeeting})
      : super(key: key);

  final List<Meeting> meetings;
  final Function(int, String, DateTime, int) updateMeeting;
  String? updatedLinkText;
  DateTime? currentData;
  @override
  State<InterviewInfoDialog> createState() => _InterviewInfoDialogState();
}

class _InterviewInfoDialogState extends State<InterviewInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
          shrinkWrap: true,
          itemCount: widget.meetings.length,
          itemBuilder: (_, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.amber.shade100, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 70.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 60),
                        Text(widget.meetings[index].eventName,
                            style: const TextStyle(
                                fontFamily: 'avenir', fontSize: 16)),
                        const SizedBox(width: 10),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                          'Update data meeting',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'avenir'),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: SizedBox(
                                          height: 220,
                                          width: 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                7))),
                                                child: InkWell(
                                                  onTap: () {
                                                    DatePicker
                                                        .showDateTimePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      onConfirm: (date) {
                                                        setState(() {
                                                          widget.currentData =
                                                              date;
                                                        });
                                                        print('confirm $date');
                                                      },
                                                      currentTime:
                                                          widget.currentData,
                                                    );
                                                  },
                                                  child: Text(
                                                      widget.currentData == null
                                                          ? widget
                                                              .meetings[index]
                                                              .from
                                                              .toString()
                                                          : widget.currentData!
                                                              .toString(),
                                                      style: const TextStyle(
                                                          fontFamily: 'avenir',
                                                          fontSize: 16)),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Constants
                                                            .mainColor
                                                            .withOpacity(0.5),
                                                        width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    borderSide: BorderSide(
                                                        color: Constants
                                                            .mainColor
                                                            .withOpacity(0.5)),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  widget.updatedLinkText =
                                                      value;
                                                  print(value);
                                                },
                                                initialValue: widget
                                                            .meetings[index]
                                                            .link ==
                                                        null
                                                    ? 'Meeting link not attached'
                                                    : widget
                                                        .meetings[index].link!,
                                              )
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text('Close',
                                                style: TextStyle(
                                                    fontFamily: 'avenir')),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Update data',
                                                style: TextStyle(
                                                    fontFamily: 'avenir')),
                                            onPressed: () {
                                              widget.updateMeeting(
                                                  widget.meetings[index].id!,
                                                  widget.updatedLinkText!,
                                                  widget.currentData!,
                                                  widget.meetings[index]
                                                      .candidateId!);
                                            },
                                          )
                                        ],
                                      ));
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: Colors.grey.shade600,
                            ))
                      ],
                    ),
                    const SizedBox(width: 30.0),
                    const SizedBox(height: 10.0),
                    Text(
                        widget.currentData == null
                            ? widget.meetings[index].from.toString()
                            : widget.currentData!.toString(),
                        style: const TextStyle(
                            fontFamily: 'avenir', fontSize: 16)),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Link meeting: ',
                      style: TextStyle(fontFamily: 'avenir', fontSize: 16),
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: () => launch(widget.meetings[index].link!),
                      child: widget.meetings[index].link != null
                          ? Text(widget.meetings[index].link!,
                              overflow: TextOverflow.visible,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontFamily: 'avenir',
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue,
                                  fontSize: 16))
                          : const Text(
                              'Meeting link not attached',
                              style:
                                  TextStyle(fontSize: 16, fontFamily: 'avenir'),
                            ),
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
