import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class LoginScreen extends StatelessWidget {
  final Signincontroller authController = Get.find<Signincontroller>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  LoginScreen({super.key});

  void _onSubmit() async {
    final String name = nameController.text.trim();
    final String phoneNumber = phoneNumberController.text.trim();
    //final String otp = otpController.text.trim();

    if (name.isNotEmpty && phoneNumber.isNotEmpty) {
      await authController.signInWithPhoneNumber(phoneNumber);
    } else {
      Get.snackbar(
        'Incomplete Information',
        'Please enter both your name and phone number.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _onverify() async {
    final String name = nameController.text.trim();
    final String otp = otpController.text.trim();
    if (otp.isNotEmpty) {
      await authController.verifyOtp(otp, name);
    } else {
      Get.snackbar(
        'Incomplete Information',
        'Please enter your otp.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                labelStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.person, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    nameController.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              controller: phoneNumberController,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(color: Colors.grey),
                hintText: 'Enter your phone number',
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    phoneNumberController.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Verify Phone Number'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: otpController,
              decoration: InputDecoration(
                labelText: 'Enter The OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'e.g. 1234',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.phone, color: Colors.teal),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    otpController.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onverify,
              child: const Text('Verify otp'),
            ),
          ],
        ),
      ),
    );
  }
}
