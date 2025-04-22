import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm_color/controller/controller.dart';

Widget BuildBandTypeSwitcher(OhmCalculatorController controller) {
  final selectedStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  );

  final unselectedStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.grey.shade200,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Obx(
        () => ElevatedButton.icon(
          icon: const Icon(Icons.settings_input_component),
          onPressed: () => controller.is4Band.value = true,
          label: const Text("4-Band"),
          style: controller.is4Band.value ? selectedStyle : unselectedStyle,
        ),
      ),
      const SizedBox(width: 20),
      Obx(
        () => ElevatedButton.icon(
          icon: const Icon(Icons.settings_input_component),
          onPressed: () => controller.is4Band.value = false,
          label: const Text("5-Band"),
          style: controller.is4Band.value ? unselectedStyle : selectedStyle,
        ),
      ),
    ],
  );
}
