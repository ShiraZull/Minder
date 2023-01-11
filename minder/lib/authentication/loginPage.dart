import 'package:flutter/material.dart';
import 'signupPage.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineMedium!,
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => const SignUpPage(),
            ),
          );
        },
        child: Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: const Text('Login Page'),
        ),
      ),
    );
  }
}
