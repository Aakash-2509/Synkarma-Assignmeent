import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 4500)); // Total splash duration + animation duration
    final box = GetStorage();
    bool isSignedIn = box.read('isSignedIn') ?? false;
    Get.offAllNamed(isSignedIn ? '/home' : '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          Colors.white,
        ],
      ),
      childWidget:
          SizedBox(height: 200, child: Image.asset("assets/flutter-logo.png")),
      duration: const Duration(milliseconds: 1500),
      animationDuration: const Duration(milliseconds: 3000),
    );
  }
}
