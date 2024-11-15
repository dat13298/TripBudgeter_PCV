import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_budgeter_2410/views/sign_in.dart';
import 'package:trip_budgeter_2410/views/sign_up/full_name_form.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          //background image
          Positioned.fill(
              child: Image.asset(
                'assets/background_welcome.jpg',
                fit: BoxFit.cover,
              )
          ),
          //layer linear
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(1.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment(0.0,0.8)
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: screenWidth*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.12,),
                Text(
                  "Trip Budgeter",
                  style: TextStyle(
                    color: const Color(0xFFEBEBEB),
                    fontSize: screenWidth * 0.12,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: screenHeight * 0.005,),
                Text(
                  "Welcome! Let's make your journey smoother and more organized.",
                  style: TextStyle(
                      color: const Color(0xFFDAD8D8),
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: screenHeight * 0.55,),

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
                        Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => const SignIn())
                        );
                      },
                  ),
                ),

                SizedBox(height: screenHeight * 0.017),

                SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.06,
                  child: CupertinoButton(
                      color: const Color(0xFF343434),
                      borderRadius: BorderRadius.circular(70.0),
                      // min: screenWidth*0.9,
                      child: Text("Sign up", style: TextStyle(
                          color: const Color(0xFFDAD8D8),
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold
                      ),),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => const FullNameForm())
                        );
                      },
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
