import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Text("Suggesta",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: "MarckScript",
                  ))),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
