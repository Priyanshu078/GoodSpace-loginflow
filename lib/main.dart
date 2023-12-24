import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodspacelogin/bloc_observer.dart';
import 'package:goodspacelogin/constants/colors.dart';
import 'package:goodspacelogin/login/getotp_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login/bloc/login_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = LoginBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w500, color: themeColor),
              unselectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: secondaryOnbardingColor),
            )),
        home: const GetOtpPage(),
      ),
    );
  }
}
