import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/fetching.dart';
import '../controllers/signin_controller.dart';

class UserScreen extends StatelessWidget {
  //final String userName = Get.arguments;
  final controller = Get.put(DataController());
  final username = Get.put(Signincontroller());

  UserScreen({super.key}); // Get the user's name from the arguments.

  @override
  Widget build(BuildContext context) {
    final currentTime = DateFormat('HH:mm').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: const Text('User Screen')),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Obx(() {
          var name = username.username;
          var data = controller.medicine.value;
          return controller.loaing.isTrue
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hi $name', style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 20),
                    Text('Current Time: $currentTime',
                        style: const TextStyle(fontSize: 18)),
                    ListTile(
                      title: Text(data.genericName.toString()),
                      subtitle: Column(
                        children: [
                          Text(data.dosageForm.toString()),
                          Text(data.activeIngredients![0].strength.toString())
                        ],
                      ),
                    )
                  ],
                );
        }),
      ),
    );
  }
}
