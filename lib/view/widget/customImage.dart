import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm_color/controller/controller.dart';

Widget CustomImage(OhmCalculatorController controller) {
  return Obx(
    () => SizedBox(
      width: 300,
      height: 155,
      child: Stack(
        children: [
          Image.asset(
            "assets/image/1.png",
            width: 300,
            height: 155,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 79.0,
            bottom: 1,
            child: Container(
              width: 16,
              height: 68,
              color:
                  controller.colorCodes[controller.firstBand.value]!['color']
                      as Color,
            ),
          ),
          Positioned(
            bottom: 8,
            left: 105,
            child: Container(
              width: 16,
              height: 54,
              color:
                  controller.colorCodes[controller.secondBand.value]!['color']
                      as Color,
            ),
          ),
          Positioned(
            bottom: 8.5,
            left: 131,
            child: Container(
              width: 17,
              height: 53.5,
              color:
                  controller.is4Band.value == true
                      ? Color(0xff6CDAF5)
                      : controller.colorCodes[controller
                              .thirdBand
                              .value]!['color']
                          as Color,
            ),
          ),
          Positioned(
            bottom: 8,
            left: 157.0,
            child: Container(
              width: 17,
              height: 54,
              color:
                  controller.colorCodes[controller
                          .multiplierBand
                          .value]!['color']
                      as Color,
            ),
          ),
          Positioned(
            bottom: 1,
            left: 202,
            child: Container(
              width: 15,
              height: 68,
              color:
                  (controller.toleranceBand.value == 'Brown')
                      ? Colors.brown
                      : Colors.red,
            ),
          ),
        ],
      ),
    ),
  );
}
