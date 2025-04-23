import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BuildToleranceSelector(
  Rx<String> selectedValue, {
  required Function(String?) onChanged,
  required Map<String, Map<String, dynamic>> colorCodes,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 140,
        child: const Text(
          "Tolerance",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      const SizedBox(width: 10),
      Obx(
        () => DropdownButton<String>(
          value: selectedValue.value,
          onChanged: onChanged,
          items:
              ['Silver', 'Gold', 'Brown', 'Red'].map<DropdownMenuItem<String>>((
                String color,
              ) {
                return DropdownMenuItem<String>(
                  value: color,
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: colorCodes[color]!['color'] as Color,

                          // (color == 'Gold')
                          //     ? const Color.fromARGB(255, 208, 173, 2)
                          //     : const Color.fromARGB(255, 145, 145, 145),
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text("$color ${colorCodes[color]!['value']} "),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    ],
  );
}
