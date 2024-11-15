import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_budgeter_2410/models/user_info_provider.dart';
import 'package:trip_budgeter_2410/view/sign_up/password_form.dart';

import '../../models/e_gender.dart';

class GenderDobForm extends StatefulWidget {
  const GenderDobForm({super.key});

  @override
  State<GenderDobForm> createState() => _GenderDobFormState();
}

class _GenderDobFormState extends State<GenderDobForm> {
  double screenHeight = 0;
  double screenWidth = 0;
  int currentStep = 4;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  Gender? _selectedGender;
  DateTime _selectedDate = DateTime.now();

  void _selectDate(BuildContext context) {
    showCupertinoModalPopup(context: context, builder: (_) => Container(
      height: 300,
      color: CupertinoColors.systemBackground,
      child: CupertinoDatePicker(
          initialDateTime: _selectedDate,
          mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (DateTime date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    ));
  }

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
                      "Select your gender and Date of Birth to create your account.",
                      style: TextStyle(
                          color: const Color(0xFFDAD8D8),
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.3,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            /// gender
                             Text(
                              'Gender',
                              style: TextStyle(
                                  color: const Color(0xFFDAD8D8),
                                  fontSize: screenWidth * 0.055,
                                  fontWeight: FontWeight.bold),
                            ),

                            SizedBox(
                              height: screenHeight * 0.02,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildGenderBox(
                                  gender: Gender.male,
                                  label: 'Male',
                                  screenWidth: screenWidth,
                                ),
                                _buildGenderBox(
                                  gender: Gender.female,
                                  label: 'Female',
                                  screenWidth: screenWidth,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: screenHeight * 0.02,
                            ),

                            ///Date of Birth

                            Text(
                              'Date of Birth',
                              style: TextStyle(
                                  color: const Color(0xFFDAD8D8),
                                  fontSize: screenWidth * 0.055,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            SizedBox(
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.06,
                              child: CupertinoButton(
                                color: const Color(0xFFEBEBEB),
                                onPressed: () => _selectDate(context),
                                child: Text(
                                  'Select Date: ${_selectedDate.toLocal().toString().split(' ')[0]}',
                                  style: TextStyle(
                                    color: const Color(0xFF343434),
                                  fontSize: screenWidth * 0.05,),
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
                                        : const Color(0xFFEBEBEB).withOpacity(0.3),
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
                                        .setGender(_selectedGender!);
                                    context
                                        .read<UserInfoProvider>()
                                        .setDoB(_selectedDate);
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                            const PasswordForm()));
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

  Widget _buildGenderBox({
    required Gender gender,
    required String label,
    required double screenWidth,
  }) {
    bool isSelected = _selectedGender == gender;
    return Container(
      width: screenWidth * 0.4,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFEBEBEB) : Colors.transparent,
        border: Border.all(
          color: isSelected ? const Color(0xFFEBEBEB) : const Color(0xFFDAD8D8),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedGender = gender;
          });
        },
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : const Color(0xFFDAD8D8),
              fontSize: screenWidth * 0.05,
            ),
          ),
        ),
      ),
    );
  }
}
