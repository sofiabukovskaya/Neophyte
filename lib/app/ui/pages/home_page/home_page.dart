import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../utils/constants.dart';
import 'tabs/calendar_tab.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: IndexedStack(
            alignment: Alignment.topCenter,
            children: [
              const Center(
                child: Text('Strings.month(1)'),
              ),
              CalendarTab(),
              const Center(
                child: Text('Strings.month(3)'),
              ),
            ],
            index: controller.currentIndex.value,
          ),
          bottomNavigationBar: BottomNavyBar(
              backgroundColor: Constants.mainLightColor,
              items: [
                BottomNavyBarItem(
                    icon: const Icon(Icons.article),
                    title: const Text('CV'),
                    activeColor: Colors.white),
                BottomNavyBarItem(
                    icon: const Icon(Icons.calendar_today),
                    title: const Text('Calendar'),
                    activeColor: Colors.white),
                BottomNavyBarItem(
                    icon: const Icon(Icons.person),
                    title: const Text('Profile'),
                    activeColor: Colors.white)
              ],
              onItemSelected: (index) => controller.changeIndex(index),
              selectedIndex: controller.currentIndex.value,
              showElevation: true)),
    );
  }
}
