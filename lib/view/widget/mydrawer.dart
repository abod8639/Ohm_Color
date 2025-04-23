import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ohm_color/view/page/ohm_deget.dart';
import 'package:ohm_color/view/page/ohm_low.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.offAll(() => const Homepage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.perm_data_setting_sharp),
            title: const Text('OHM LOW'),
            onTap: () {
              Get.to(() => const OhmLowPage());
            },
          ),
          const SizedBox(height: 80),

          const Spacer(),
          ToggleSwitch(
            initialLabelIndex: 3,
            totalSwitches: 3,
            icons: const [
              Icons.dark_mode,
              Icons.light_mode,
              Icons.phone_android,
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
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
