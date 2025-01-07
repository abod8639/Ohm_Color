import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ohm_color_2/deget5.dart';
import 'package:ohm_color_2/mydrawer.dart';
import 'package:ohm_color_2/unit.dart';

class OhmCalculator extends StatelessWidget {
  const OhmCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final OhmCalculatorController controller =
        Get.put(OhmCalculatorController());

    return Scaffold(
      drawer: const Mydrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    icon: const Icon(Icons.settings_input_component_sharp),
                    onPressed: () {
                      Get.to(const OhmCalculator());
                    },
                    label: const Text("3-4")),
                TextButton.icon(
                    icon: const Icon(Icons.settings_input_component_sharp),
                    onPressed: () {
                      Get.to(const OhmCalculator5());
                    },
                    label: const Text("5")),

                // TextButton.icon(
                //   icon: const Icon(Icons.settings_input_component_sharp),
                //   onPressed: (){
                //     Get.to(const ohm_meter_2());
                //   }, label: const Text("6")),
              ],
            ),
            const SizedBox(height: 50),
            Obx(() => Text(
                  controller.getResistance(),
                  style: const TextStyle(fontSize: 24),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Band 1",
                style: TextStyle(fontWeight: FontWeight.bold ),
                ),
                const SizedBox(width: 10,),
                Obx(() => DropdownButton<String>(
                      value: controller.firstBand.value,
                      onChanged: (String? newValue) {
                        controller.firstBand.value = newValue!;
                      },
                      items: controller.colorCodes.keys
                          .map<DropdownMenuItem<String>>((String color) {
                        return DropdownMenuItem<String>(
                          enabled: T,
                          value: color,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color:
                                controller.colorCodes[color]!['color'] as Color,
                              ),
                              const SizedBox(width: 3),
                              Text(color),
                            ],
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Band 2",
                style: TextStyle(fontWeight: FontWeight.bold ),
                ),
                const SizedBox(width: 10,),
                Obx(() => DropdownButton<String>(
                      value: controller.secondBand.value,
                      onChanged: (String? newValue) {
                        controller.secondBand.value = newValue!;
                      },
                      items: controller.colorCodes.keys
                          .map<DropdownMenuItem<String>>((String color) {
                        return DropdownMenuItem<String>(
                          value: color,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color:
                                    controller.colorCodes[color]!['color'] as Color,
                              ),
                              const SizedBox(width: 3),
                              Text(color),
                            ],
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Band 3",
                style: TextStyle(fontWeight: FontWeight.bold ),
                ),
                const SizedBox(width: 10,),
                Obx(() => DropdownButton<String>(
                      value: controller.multiplierBand.value,
                      onChanged: (String? newValue) {
                        controller.multiplierBand.value = newValue!;
                      },
                      items: controller.colorCodes.keys
                          .map<DropdownMenuItem<String>>((String color) {
                        return DropdownMenuItem<String>(
                          value: color,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color:
                                    controller.colorCodes[color]!['color'] as Color,
                              ),
                              const SizedBox(width: 3),
                              
                              Text(color),
                            ],
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Tolerance",
                style: TextStyle(fontWeight: FontWeight.bold ),
                ),
                const SizedBox(width: 10,),
                Obx(() => DropdownButton<String>(
                      value: controller.toleranceBand.value,
                      onChanged: (String? newValue) {
                        controller.toleranceBand.value = newValue!;
                      },
                      items: ['Brown', 'Red']
                          .map<DropdownMenuItem<String>>((String color) {
                        return DropdownMenuItem<String>(
                          value: color,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color:
                                    (color == 'Brown') ? Colors.brown : Colors.red,
                              ),
                              const SizedBox(width: 3),
                              Text(color),
                            ],
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
