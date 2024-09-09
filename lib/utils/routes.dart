import 'package:assignment_app/screens/home/homescreen.dart';
import 'package:assignment_app/screens/signin/signinscreen.dart';
import 'package:assignment_app/screens/signup/signupscreen.dart';
import 'package:get/route_manager.dart';

class Routes {
  static final pages = [
    GetPage(name: '/signin', page: () => const SignInScreen()),
    GetPage(name: '/signup', page: () => const SignUpScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}
