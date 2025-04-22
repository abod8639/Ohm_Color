import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm_color/controller/controller.dart';

Widget TextResist(OhmCalculatorController controller) {
  return Obx(
    () => Text(
      controller.is4Band.value
          ? controller.getResistance()
          : controller.getResistance5(),
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
  );
}
