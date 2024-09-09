import 'package:assignment_app/screens/signin/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final String? name = box.read('name');
    final String? email = box.read('email');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: $name'),
          Text('Email: $email'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              box.write('isSignedIn', false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}