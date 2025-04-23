import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BuildToleranceSelector(
  Rx<String> selectedValue, {
  required Function(String?) onChanged,
  required Map<String, Map<String, dynamic>> tolerancecolorCodes,
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
              tolerancecolorCodes.keys.map<DropdownMenuItem<String>>((
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
                          color: tolerancecolorCodes[color]!['color'] as Color,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text("$color ${tolerancecolorCodes[color]!['value']}±"),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    ],
  );
}
