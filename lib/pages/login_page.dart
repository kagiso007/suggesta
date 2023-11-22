// ignore_for_file: camel_case_types, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suggesta/pages/forgot_password_page.dart';
import 'package:suggesta/pages/sign_up_page.dart';
import 'package:suggesta/homePage/home_page.dart';
import 'package:validators/validators.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // logo here
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/appLogo.png'),
                    radius: 120,
                  ),

                  const SizedBox(height: 20),
                  Text(
                    'SUGGESTA',
                    style: GoogleFonts.abel(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Container(
                    height: isEmailCorrect ? 280 : 200,
                    // _formKey!.currentState!.validate() ? 200 : 600,
                    // height: isEmailCorrect ? 260 : 182,
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
                            key: _formKey,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const home_page()),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ))
                            : Container(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'don\'t an account?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signUpPage()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => forgotPasswordPage()),
                          );
                        },
                        child: const Text(
                          'forgot password?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
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
