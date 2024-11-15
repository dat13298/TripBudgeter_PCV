import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:trip_budgeter_2410/connection/firebase_connection.dart';
import 'package:trip_budgeter_2410/view/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_budgeter_2410/view/welcome.dart';

import 'models/user_info_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FireStoreService.initializeFirebase();

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserInfoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Welcome",
      theme: CupertinoThemeData(
        // Áp dụng Google Fonts cho toàn bộ văn bản
        textTheme: CupertinoTextThemeData(
          textStyle: GoogleFonts.roboto(
            fontSize: 16,
            color: const Color(0xFF4B4B4B),
          ),
        ),
        primaryColor: const Color(0xFF666666), // Màu chính cho theme
      ),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
