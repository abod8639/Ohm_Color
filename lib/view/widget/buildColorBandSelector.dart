import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BuildColorBandSelector(
  String label,
  Rx<String> selectedValue,
  Map<String, Map<String, dynamic>> colorCodes, {
  required Function(String?) onChanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 140,
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      const SizedBox(width: 10),
      Obx(
        () => DropdownButton<String>(
          value: selectedValue.value,
          onChanged: onChanged,
          items:
              colorCodes.keys.map<DropdownMenuItem<String>>((String color) {
                return DropdownMenuItem<String>(
                  value: color,
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: colorCodes[color]!['color'] as Color,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(color),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    ],
  );
}
