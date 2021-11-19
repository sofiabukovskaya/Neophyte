import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  static const int _indexMain = 0;
  static const int _indexCV = 1;
  static const int _indexCalendar = 2;
  static const int _indexProfile = 3;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          alignment: Alignment.topCenter,
          children: const [
            Center(
              child: Text('Strings.month(1)'),
            ),
            Center(
              child: Text('Strings.month(2)'),
            ),
            Center(
              child: Text('Strings.month(3)'),
            ),
            Center(
              child: Text('Strings.month(4)'),
            ),
          ],
          index: controller.currentIndex.value,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          backgroundColor: Constants.mainColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: _getTint(
                  isSelected: controller.currentIndex.value == _indexMain,
                ),
              ),
              label: '',
            ), BottomNavigationBarItem(
              icon: Icon(
                Icons.article,
                color: _getTint(
                  isSelected: controller.currentIndex.value == _indexCV,
                ),
              ),
              label: '',
            ), BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: _getTint(
                  isSelected: controller.currentIndex.value == _indexCalendar,
                ),
              ),
              label: '',
            ), BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _getTint(
                  isSelected: controller.currentIndex.value == _indexProfile,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Color _getTint({required bool isSelected}) =>
      isSelected ? Colors.white : Constants.mainLightColor;
}
