import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class Signincontroller extends GetxController {
  RxString username = "".obs;
  late String _verificationId;
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        log(e.toString());
        Get.snackbar(
          'Verification Failed',
          'Failed to verify phone number. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        Get.snackbar(
          'code sent ',
          ' check your message',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOtp(String otp, String name) async {
    // Create a PhoneAuthCredential with the code
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otp);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      await _firestore.collection('users').doc(auth.currentUser!.uid).set({
        'name': name,
      });
      Get.offAllNamed('/user');
    } catch (e) {
      Get.snackbar(
        'wrong otp',
        ' Enter correct otp.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> retrieveUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      final userName =
          (snapshot.data() as Map<String, dynamic>)['name'] ?? "userName";

      final box = await Hive.openBox('userBox');
      await box.put('name', userName);

      username.value = box.get('name');
      print(userName.toString());
    }
  }

  @override
  void onInit() {
    retrieveUserName();
    super.onInit();
  }
}
