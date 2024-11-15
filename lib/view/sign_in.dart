import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        border: null,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Color(0xFFEBEBEB),
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/background_sign_in.jpg',
            fit: BoxFit.cover,
          )),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(1.0),
              ], begin: Alignment.topCenter, end: Alignment(0.0, 0.8)),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.12,
                    ),
                    ///title
                    Text(
                      "Sign in",
                      style: TextStyle(
                          color: const Color(0xFFEBEBEB),
                          fontSize: screenWidth * 0.12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    ///description
                    Text(
                      "Sign in your account and enjoy your trip.",
                      style: TextStyle(
                          color: const Color(0xFFDAD8D8),
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.45,
                    ),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            /// textField mail
                            Container(
                              width: screenWidth * 0.9,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: CupertinoTextFormFieldRow(
                                placeholder: 'Enter your email',
                                placeholderStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                obscureText: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.025
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            ///textField password
                            Container(
                              width: screenWidth * 0.9,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CupertinoTextFormFieldRow(
                                      placeholder: 'Enter your password',
                                      placeholderStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                      obscureText: _obscureText,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenHeight * 0.025,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText
                                          ? CupertinoIcons.eye
                                          : CupertinoIcons.eye_solid,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: screenHeight * 0.035,
                            ),
                            /// submit button
                            SizedBox(
                              width: screenWidth*0.9,
                              height: screenHeight*0.06,
                              child: CupertinoButton(
                                color: const Color(0xFFEBEBEB),
                                borderRadius: BorderRadius.circular(70.0),
                                // min: screenWidth*0.9,
                                child: Text("Sign in", style: TextStyle(
                                    color: const Color(0xFF343434),
                                    fontSize: screenWidth * 0.055,
                                    fontWeight: FontWeight.bold
                                ),),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                        context,
                                        CupertinoPageRoute(builder: (context) => const HomePage())
                                    );
                                  } else {
                                    print("faillllllll");
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                    )

                  ],
                ),
              ))
        ],
      ),
    );
  }
}
