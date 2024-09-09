import 'package:assignment_app/screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/signin/signinscreen.dart';
import 'screens/home/homescreen.dart';

void main() async {
  await GetStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/signin': (context) => const SignInScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
