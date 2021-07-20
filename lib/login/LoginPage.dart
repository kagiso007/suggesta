import 'dart:ui';
import 'package:flutter/material.dart';
import 'Header.dart';
import 'InputWrapper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[800],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            Header(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
