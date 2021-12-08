import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user.dart';
import '../../../../utils/constants.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key, required this.logOut, required this.user})
      : super(key: key);

  final VoidCallback logOut;
  final User? user;

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int _radioValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 120,
                width: 120,
                child:
                    Image.asset('assets/images/avatar.png', fit: BoxFit.fill)),
            Text('${widget.user?.firstName}  ${widget.user?.lastName}',
                style: const TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
            const SizedBox(width: 20)
          ],
        ),
      ),
      const SizedBox(height: 40),
      const Divider(thickness: 1),
      const SizedBox(height: 50),
      Row(
        children: [
          const SizedBox(width: 35),
          const Text('Email: ',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 25),
          Text('${widget.user?.email}',
              style: const TextStyle(fontFamily: 'avenir', fontSize: 22))
        ],
      ),
      const SizedBox(height: 40),
      Row(
        children: [
          const SizedBox(width: 35),
          const Text('Company: ',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 25),
          Text('${widget.user?.company}',
              style: const TextStyle(fontFamily: 'avenir', fontSize: 22))
        ],
      ),
      const SizedBox(height: 40),
      Row(
        children: [
          const SizedBox(width: 35),
          const Text('Gender: ',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 25),
          Text('${widget.user?.gender}',
              style: const TextStyle(fontFamily: 'avenir', fontSize: 22))
        ],
      ),
      const SizedBox(height: 50),
      const Divider(thickness: 1),
      const SizedBox(height: 20),
      InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Edit profile',
                        style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 22,
                            fontWeight: FontWeight.w700)),
                    content: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        height: 355,
                        width: 400,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5)),
                                ),
                              ),
                              initialValue: widget.user!.firstName,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5)),
                                ),
                              ),
                              initialValue: widget.user!.lastName,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5)),
                                ),
                              ),
                              initialValue: widget.user!.email,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5)),
                                ),
                              ),
                              initialValue: widget.user!.company,
                            ),
                            const SizedBox(height: 10),
                            Center(
                                child: Text(
                              'Gender: ',
                              style: TextStyle(fontFamily: 'avenir'),
                            )),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _radioValue,
                                  onChanged: _handleRadioValueChange,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(fontFamily: 'avenir'),
                                ),
                                new Radio(
                                  value: 1,
                                  groupValue: _radioValue,
                                  onChanged: _handleRadioValueChange,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(fontFamily: 'avenir'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Cancel',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                color: Constants.mainLightColor,
                                fontSize: 20,
                              ))),
                      TextButton(
                          onPressed: widget.logOut,
                          child: Text('Update data',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                color: Constants.mainColor,
                                fontSize: 20,
                              )))
                    ],
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: ListTile(
            title: const Text('Edit profile',
                style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
            trailing: Icon(Icons.edit, color: Colors.black),
          ),
        ),
      ),
      const SizedBox(height: 20),
      InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Log out',
                        style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 22,
                            fontWeight: FontWeight.w700)),
                    content: const Text(
                        'Are you sure you want to log out from your profile?',
                        style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: 20,
                        )),
                    actions: [
                      TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Cancel',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                fontSize: 20,
                              ))),
                      TextButton(
                          onPressed: widget.logOut,
                          child: Text('Log out',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.red.shade700,
                                fontSize: 20,
                              )))
                    ],
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: ListTile(
            title: Text('Log out',
                style: TextStyle(
                    fontFamily: 'avenir',
                    color: Colors.red.shade700,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
            trailing: Icon(
              Icons.logout,
              color: Colors.red.shade700,
            ),
          ),
        ),
      )
    ]);
  }
}
