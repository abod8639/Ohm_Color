import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm_color/controller/controller.dart';
import 'package:ohm_color/view/widget/ItembandList.dart';
import 'package:ohm_color/view/widget/buildBandTypeSwitcher.dart';
import 'package:ohm_color/view/widget/customImage.dart';
import 'package:ohm_color/view/widget/mydrawer.dart';
import 'package:ohm_color/view/widget/textResist.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final OhmCalculatorController controller = Get.put(
      OhmCalculatorController(),
    );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Builder(
        builder: (context) {
          return SafeArea(
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.list),
            ),
          );
        },
      ),
      drawer: const Mydrawer(),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                BuildBandTypeSwitcher(controller),

                CustomImage(controller),

                const SizedBox(height: 30),

                TextResist(controller),

                ItembandList(controller),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
