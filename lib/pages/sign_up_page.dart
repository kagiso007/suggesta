// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  final TextEditingController _textEditingController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  bool _passwordVisible = false;
  bool _resendButton = false;

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  void buttonState() {
    _resendButton = false;
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 75, 74, 74),
          leading: const BackButton(color: Colors.yellow),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/appLogo.png'),
                radius: 20,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
              Text('Sign Up',
                  style: TextStyle(color: Colors.yellow, fontSize: 18)),
            ],
          )),
      body: Container(
        color: Colors.yellow,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: isEmailCorrect ? 480 : 400,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 3)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: TextFormField(
                            controller: _textEditingController,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              labelText: "Email",
                              hintText: 'your-email@domain.com',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                            child: TextFormField(
                              obscuringCharacter: '*',
                              obscureText: true,
                              decoration: const InputDecoration(
                                suffix: Icon(Icons.visibility),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Password",
                                hintText: '*********',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty && value.length < 5) {
                                  return 'Enter a valid password';
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              obscuringCharacter: '*',
                              obscureText: true,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Confirm Password",
                                hintText: '*********',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty && value.length < 5) {
                                  return 'Enter a valid password';
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                            child: TextFormField(
                              obscuringCharacter: '*',
                              obscureText: true,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Username",
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty && value.length < 3) {
                                  return 'username must be more than three characters';
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        isEmailCorrect
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    backgroundColor: isEmailCorrect == false
                                        ? Colors.red
                                        : Colors.yellow,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 131, vertical: 20),
                                    side: const BorderSide(
                                        width: 4, // the thickness
                                        color: Colors
                                            .black // the color of the border
                                        )),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    //Loading
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ))
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
