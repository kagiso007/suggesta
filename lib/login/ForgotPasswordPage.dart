import 'dart:ui';
import 'package:flutter/material.dart';
import 'FPInputWrapper.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Forgot password"),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[800],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              child: FPInputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
