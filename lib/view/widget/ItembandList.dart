import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm_color/controller/controller.dart';
import 'package:ohm_color/view/widget/buildToleranceSelector.dart';

import 'buildColorBandSelector.dart';

Widget ItembandList(OhmCalculatorController controller) {
  return Column(
    children: [
      const SizedBox(height: 40),
      //*Band 1
      BuildColorBandSelector(
        "Band 1",
        controller.firstBand,
        controller.colorCodes,
        onChanged: (value) => controller.firstBand.value = value!,
      ),

      const SizedBox(height: 15),

      //*Band 2
      BuildColorBandSelector(
        "Band 2",
        controller.secondBand,
        controller.colorCodes,
        onChanged: (value) => controller.secondBand.value = value!,
      ),

      Obx(
        () =>
            controller.is4Band.value == false
                ? Column(
                  children: [
                    const SizedBox(height: 15),
                    BuildColorBandSelector(
                      "Band 3",
                      controller.thirdBand,
                      controller.colorCodes,
                      onChanged: (value) => controller.thirdBand.value = value!,
                    ),
                  ],
                )
                : SizedBox(),
      ),

      const SizedBox(height: 15),

      Obx(
        () => BuildColorBandSelector(
          controller.is4Band.value
              ? "Band 3 (Multiplier)"
              : "Band 4 (Multiplier)",
          controller.multiplierBand,
          controller.colorCodes,
          onChanged: (value) => controller.multiplierBand.value = value!,
        ),
      ),

      const SizedBox(height: 15),

      BuildToleranceSelector(
        controller.toleranceBand,
        colorCodes: controller.colorCodes,
        onChanged: (value) => controller.toleranceBand.value = value!,
      ),
      const SizedBox(height: 30),
    ],
  );
}
