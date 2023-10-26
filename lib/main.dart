// @dart=3.0.6
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
           primaryColor: Color(0xFF000000),
           scaffoldBackgroundColor: Color(0xFF000000),
           appBarTheme: AppBarTheme(
             backgroundColor: Color(0xFF212121),
           ),
        ),
        home: MainScreen(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: "/",

    );
  }
}



