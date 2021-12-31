import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/constants/theme.dart';
import 'package:getx_state_management/controllers/count_controller.dart';
import 'package:getx_state_management/controllers/theme_controller.dart';
import 'package:getx_state_management/presentation/simple_home_page.dart';
import 'package:getx_state_management/presentation/user_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final themeController = Get.find<ThemeController>();
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                themeController.changeTheme(Themes.lightTheme);
                themeController.saveTheme(false);
              } else {
                themeController.changeTheme(Themes.darkTheme);
                themeController.saveTheme(true);
              }
            },
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Obx(
              () => Text(
                '${countController.obxCount}',
                style: const TextStyle(fontSize: 48.0),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                  onPressed: () => countController.decrement(),
                  tooltip: 'simpleDecrement',
                  label: const Text('Decrement'),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    countController.increment();
                  },
                  tooltip: 'simpleIncrement',
                  label: const Text('Increment'),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () => Get.to(SimpleHomePage()),
              child: const Text('Simple Home Page'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () => Get.to(UserPage()),
              child: const Text('User Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
