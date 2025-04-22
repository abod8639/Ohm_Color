import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BuildToleranceSelector(
  Rx<String> selectedValue, {
  required Function(String?) onChanged,
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
              ['Brown', 'Red'].map<DropdownMenuItem<String>>((String color) {
                return DropdownMenuItem<String>(
                  value: color,
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: (color == 'Brown') ? Colors.brown : Colors.red,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text("$color (±${color == 'Brown' ? '1' : '2'}%)"),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    ],
  );
}
