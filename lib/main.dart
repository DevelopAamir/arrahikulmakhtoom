import 'package:arrahikulmakhtoom/pages/spalsh_screen.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ar\'rahikul Makhtoom ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: primaryColor,
              displayColor: primaryColor,
            ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
