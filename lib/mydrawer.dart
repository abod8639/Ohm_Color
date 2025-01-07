import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ohm_color_2/deget3_4.dart';
import 'package:ohm_color_2/deget5.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.settings_input_component_sharp),
                  Text("  3-4 DEGET"),
                ],
              ),
              onTap: () {
                Get.to(const OhmCalculator());
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.settings_input_component_sharp),
                  Text("     5 DEGET"),
                ],
              ),
              onTap: () {
                Get.to(const OhmCalculator5());
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.settings_input_component_sharp),
                  Text("     5 DEGET"),
                ],
              ),
              onTap: () {
                Get.to(const OhmCalculator5());
              },
            ),
            const Spacer(),
            ToggleSwitch(
              initialLabelIndex: 3 ,
              totalSwitches: 3,
              icons: const [
                Icons.dark_mode,
                Icons.light_mode, 
                Icons.phone_android
              ],
              // labels: const ['America', 'Canada', 'Mexico'],
              changeOnTap: T,
              onToggle: (index) {
                if (index == 0) {
                  Get.changeThemeMode(ThemeMode.dark);
                  // Get.changeTheme(ThemeData.dark());
                } else if (index == 1) {
                  Get.changeThemeMode(ThemeMode.light);
                  // Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeThemeMode(ThemeMode.system);
                  // Get.changeTheme(ThemeData());
                }

                // print('switched to: $index');
              },
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      );
  }
}