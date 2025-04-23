import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//------------------------------------------------------------------------

class OhmCalculatorController extends GetxController {
  //------------------------------------------------------------------------

  RxBool is4Band = true.obs;

  //------------------------------------------------------------------------

  final colorCodes = {
    'Black': {'value': 0, 'color': Colors.black},
    'Brown': {'value': 1, 'color': Colors.brown},
    'Red': {'value': 2, 'color': Colors.red},
    'Orange': {'value': 3, 'color': Colors.orange},
    'Yellow': {'value': 4, 'color': Colors.yellow},
    'Green': {'value': 5, 'color': Colors.green},
    'Blue': {'value': 6, 'color': Colors.blue},
    'Violet': {'value': 7, 'color': Colors.purple},
    'Gray': {'value': 8, 'color': Colors.grey},
    'White': {'value': 9, 'color': Colors.white},
    'Gold': {'value': 10, 'color': const Color.fromARGB(255, 208, 173, 2)},
    'Silver': {'value': 5, 'color': const Color.fromARGB(255, 145, 145, 145)},
  };
  final tolerancecolorCodes = {
    'Black': {'value': 0, 'color': Colors.black},
    'Brown': {'value': 1, 'color': Colors.brown},
    'Red': {'value': 2, 'color': Colors.red},
    // 'Orange': {'value': 3, 'color': Colors.orange},
    // 'Yellow': {'value': 4, 'color': Colors.yellow},
    // 'Green': {'value': 5, 'color': Colors.green},
    'Blue': {'value': 6, 'color': Colors.blue},
    'Violet': {'value': 7, 'color': Colors.purple},
    'Gold': {'value': 10, 'color': const Color.fromARGB(255, 208, 173, 2)},
    'Silver': {'value': 5, 'color': const Color.fromARGB(255, 145, 145, 145)},
  };

  //------------------------------------------------------------------------

  RxString firstBand = 'Brown'.obs;
  RxString secondBand = 'Black'.obs;
  RxString thirdBand = 'Black'.obs;
  RxString multiplierBand = 'Red'.obs;
  RxString toleranceBand = 'Silver'.obs;

  //------------------------------------------------------------------------

  String formatResistance(double value) {
    if (value >= 1e9) {
      return '${(value / 1e9).toStringAsFixed(1)}GΩ';
    } else if (value >= 1e6) {
      return '${(value / 1e6).toStringAsFixed(1)}MΩ';
    } else if (value >= 1e3) {
      return '${(value / 1e3).toStringAsFixed(1)}kΩ';
    } else {
      return '$valueΩ';
    }
  }

  //------------------------------------------------------------------------
  //*there band

  String getResistance() {
    int firstDigit = colorCodes[firstBand.value]!['value'] as int;
    int secondDigit = colorCodes[secondBand.value]!['value'] as int;

    int multiplier = colorCodes[multiplierBand.value]!['value'] as int;
    int tolerance = colorCodes[toleranceBand.value]!['value'] as int;

    double resistanceValue =
        (firstDigit * 10.0 + secondDigit) * pow(10, multiplier);
    return '${formatResistance(resistanceValue)} ±$tolerance%';
  }

  //------------------------------------------------------------------------
  //*five band

  String getResistance5() {
    int firstDigit = colorCodes[firstBand.value]!['value'] as int;
    int secondDigit = colorCodes[secondBand.value]!['value'] as int;
    int thirdDigit = colorCodes[thirdBand.value]!['value'] as int;
    int multiplier = colorCodes[multiplierBand.value]!['value'] as int;
    int tolerance = tolerancecolorCodes[toleranceBand.value]!['value'] as int;

    double resistanceValue =
        (firstDigit * 100.0 + secondDigit * 10 + thirdDigit) *
        pow(10, multiplier);
    return '${formatResistance(resistanceValue)} ±$tolerance%';
  }
}
