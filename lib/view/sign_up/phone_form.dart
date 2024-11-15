import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_budgeter_2410/main.dart';
import 'package:trip_budgeter_2410/models/user_info_provider.dart';

import 'gender_DoB_form.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({super.key});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  double screenHeight = 0;
  double screenWidth = 0;
  int currentStep = 3;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();

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
          child: const Icon(
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
              ], begin: Alignment.topCenter, end: const Alignment(0.0, 0.8)),
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
                      "Sign up",
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
                      "Enter your phone number to create your account.",
                      style: TextStyle(
                          color: const Color(0xFFDAD8D8),
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.5,
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
                                controller: _phoneNumberController,
                                placeholder: 'Enter your phone number',
                                placeholderStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                obscureText: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.025),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: screenHeight * 0.02,
                            ),

                            ///step indicator
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(5, (index) {
                                return Container(
                                  width: (screenWidth * 0.9 - 16) / 5,
                                  height: 5.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    color: index < currentStep
                                        ? Colors.white
                                        : Color(0xFFEBEBEB).withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                );
                              }),
                            ),

                            SizedBox(
                              height: screenHeight * 0.035,
                            ),

                            /// submit button
                            SizedBox(
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.06,
                              child: CupertinoButton(
                                color: const Color(0xFFEBEBEB),
                                borderRadius: BorderRadius.circular(70.0),
                                // min: screenWidth*0.9,
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: const Color(0xFF343434),
                                      fontSize: screenWidth * 0.055,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<UserInfoProvider>()
                                        .setPhone(_phoneNumberController.text);
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const GenderDobForm()));
                                  }
                                },
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
