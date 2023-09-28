import 'dart:html';

import 'package:flutter/material.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final token = window.localStorage["token"];
    return Scaffold(
      body: Center(child: Text("Here's your token: $token")),
    );
  }
}