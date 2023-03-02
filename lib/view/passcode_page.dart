import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

const storedPasscode = '1234';

class PassCodePage extends StatefulWidget {
  const PassCodePage({super.key});

  @override
  State<PassCodePage> createState() => _PassCodePageState();
}

class _PassCodePageState extends State<PassCodePage> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    return PasscodeScreen(
      title: const Text(
        'Enter PIN',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 28),
      ),
      circleUIConfig: const CircleUIConfig(
          borderColor: Colors.black, fillColor: Colors.black),
      keyboardUIConfig: const KeyboardUIConfig(
          digitTextStyle: TextStyle(fontSize: 30, color: Colors.black),
          digitBorderWidth: 0),
      isValidCallback: () {
        Get.toNamed("/home");
      },
      passwordEnteredCallback: ((code) {
        bool isValid = storedPasscode == code;
        _verificationNotifier.add(isValid);
        if (!isValid) {
          Get.snackbar("Error", "Pin not match");
        }
      }),
      cancelButton: const Text(""),
      deleteButton: const Text(
        'Delete',
        style: TextStyle(fontSize: 16, color: Colors.black),
        semanticsLabel: 'Delete',
      ),
      shouldTriggerVerification: _verificationNotifier.stream,
      backgroundColor: Colors.white,
      cancelCallback: (() {}),
      digits: null,
      passwordDigits: 4,
      bottomWidget: Container(),
    );
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}
