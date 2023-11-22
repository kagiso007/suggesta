// ignore_for_file: camel_case_types, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordPageState();
}

class _forgotPasswordPageState extends State<forgotPasswordPage> {
  TextEditingController _textEditingController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = "";
  bool _resendButton = false;
  bool resetPassword = false;
  bool resendLink = false;

  @override
  void initState() {
    _resendButton = false;
  }

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 75, 74, 74),
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
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
              Text('Forgot Password',
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
                    height: isEmailCorrect ? 200 : 130,
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
                            validator: (value) {
                              if (!EmailValidator.validate(email)) {
                                return 'Please enter a valid email';
                              }
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
                        const SizedBox(height: 20),
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
                                    // ignore: todo
                                    //Loading  TODO
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Get Password',
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
