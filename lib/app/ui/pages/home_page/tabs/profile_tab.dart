import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/user.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key, required this.logOut, required this.user})
      : super(key: key);

  final VoidCallback logOut;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 100, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 120,
                width: 120,
                child:
                    Image.asset('assets/images/avatar.png', fit: BoxFit.fill)),
            Text('${user?.firstName}  ${user?.lastName}',
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
          Text('${user?.email}',
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
          Text('${user?.company}',
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
          Text('${user?.gender}',
              style: const TextStyle(fontFamily: 'avenir', fontSize: 22))
        ],
      ),
      const SizedBox(height: 50),
      const Divider(thickness: 1),
      const SizedBox(height: 40),
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
                          onPressed: logOut,
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
