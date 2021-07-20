import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpInputField extends StatefulWidget {
  @override
  _SignUpInputFieldState createState() => _SignUpInputFieldState();
}

class _SignUpInputFieldState extends State<SignUpInputField> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white))),
            child: TextField(
              controller: _usernameController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Enter Usename",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white))),
            child: TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white))),
            child: TextField(
              controller: _passwordController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.yellow))),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(height: 120),
          InkWell(
            onTap: () {
              if (isLoading) {
                return;
              }
              if (_usernameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("please enter username"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
                return;
              }
              if (!reg.hasMatch(_emailController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("enter valid email"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
                return;
              }
              if (_passwordController.text.isEmpty ||
                  _passwordController.text.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Password should be atleast 6 characters"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
                return;
              }
              signup(_usernameController.text, _emailController.text,
                  _passwordController.text);
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  signup(username, email, password) async {
    setState(() {
      isLoading = true;
    });
    print("Calling");

    Map data = {'EMAIL': email, 'PASSWORD': password, 'USERNAME': username};
    print(data.toString());
    final response = await http.post(
        Uri.parse("https://lamp.ms.wits.ac.za/home/s1854776/signup.php"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      Map<String, dynamic> resposne = jsonDecode(response.body);
      if (!resposne['error']) {
        Map<String, dynamic> user = resposne['data'];
        print(" Username ${user['data']}");
        savePref(user['USERNAME'], user['EMAIL']);
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        print(" ${resposne['message']}");
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${resposne['message']}"),
          duration: Duration(milliseconds: 300),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("please try again"),
          duration: Duration(milliseconds: 300),
        ),
      );
    }
  }

  savePref(String name, String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("name", name);
    preferences.setString("email", email);
    preferences.commit();
  }
}
