import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({
    super.key,
    required this.onLoginComplete,
  });

  final VoidCallback onLoginComplete;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineMedium!,
      child: GestureDetector(
        // This moves from the personal info page to the credentials page,
        // replacing this page with that one.
        onTap: onLoginComplete,
        onHorizontalDragStart: (details) {
          Navigator.of(context).pushReplacementNamed('auth/signup');
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

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
    required this.onSignupComplete,
  });

  final VoidCallback onSignupComplete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignupComplete,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headlineMedium!,
        child: Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: const Text('Signup Page'),
        ),
      ),
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // SignUpPage builds its own Navigator which ends up being a nested
    // Navigator in our app.
    return WillPopScope(
      onWillPop: () async => false,
      child: Navigator(
        initialRoute: 'auth/login',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'auth/login':
              // Assume CollectPersonalInfoPage collects personal info and then
              // navigates to 'auth/choose_credentials'.
              builder = (BuildContext _) => LogInPage(
                    onLoginComplete: () {
                      Navigator.of(context).pop();
                    },
                  );
              break;
            case 'auth/signup':
              // Assume ChooseCredentialsPage collects new credentials and then
              // invokes 'onSignupComplete()'.
              builder = (BuildContext _) => SignUpPage(
                    onSignupComplete: () {
                      // Referencing Navigator.of(context) from here refers to the
                      // top level Navigator because SignUpPage is above the
                      // nested Navigator that it created. Therefore, this pop()
                      // will pop the entire "sign up" journey and return to the
                      // "/" route, AKA HomePage.
                      Navigator.of(context).pop();
                    },
                  );
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        },
      ),
    );
  }
}
