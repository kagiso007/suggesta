import 'dart:ui';
import 'package:flutter/material.dart';
import 'SignUpInputField.dart';

class InputWrapper2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: SignUpInputField(),
            ),
          ],
        ),
      ),
    );
  }
}
