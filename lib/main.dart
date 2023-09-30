import 'package:flutter/material.dart';
import 'package:ktuliq_bot_web_app/controlpanel.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:io';
import 'dart:html';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ktuliq bot',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData. dark(useMaterial3: true),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const bottomText = """
Control Panel for Ktuliq
Use at your own risk
""";

  void _login() {
    launchUrl(Uri.parse("${window.location.origin}/auth"), webOnlyWindowName: "_self");
  }

  @override
  Widget build(BuildContext context) {
    if(window.localStorage["userId"] != null && window.localStorage["token"] != null) {
      return ControlPanel();
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: RadialGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade900], center: Alignment(-1.3, -1.3), radius: 2.0)),
        child: Center(child: Container(
          margin: EdgeInsets.all(32),
          child: Flex(
            direction: (MediaQuery.of(context).size.width > 600)? Axis.horizontal : Axis.vertical,
            mainAxisSize: (MediaQuery.of(context).size.width > 600)? MainAxisSize.max : MainAxisSize.min,
            children: [
              //* Login
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade900,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                ),
                onPressed: () => _login(),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Login via Discord", style: TextStyle(fontSize: 22)),
                ),
              ),
        
              //*margin box xd
              Container(height: 50, width: 50,),
              
              //* other
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(child: Text(bottomText))
                ],
              )
            ]
          ),
        )),
      ),
    );
  }
}
