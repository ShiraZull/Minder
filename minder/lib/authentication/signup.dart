import 'package:flutter/material.dart';
import '../home.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  void logged (bool loggedIn) async {
    prefs = await SharedPreferences.getInstance();
    await prefs?.setBool('loggedIn', loggedIn);
  }

  Function() getHome(BuildContext context, bool loggedIn) {
    return () {
      logged(loggedIn);
      Navigator.of(context).popUntil((route) => false);
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => const HomePage(),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineMedium!,
      child: Stack(
        children: [
          Container(
            color: Colors.pinkAccent,
            alignment: Alignment.center,
            child: const Text('Signup Page'),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                TextButton(
                  onPressed: getHome(context, false),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('Trial', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: getHome(context, true),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('SignUp', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
