import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minder/config/palette.dart';
import 'package:minder/views/mainPage.dart';
import 'package:minder/views/signupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.backgroundColor});

  final Color backgroundColor;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double paddingMinderTextLeft = 0,
      paddingMinderTextTop = 0,
      minderTextSize = 0,
      paddingMinderImageLeft = 0,
      paddingMinderImageTop = 0,
      paddingLoginButtonLeft = 0,
      paddingLoginButtonBottom = 0,
      loginSigninButtonSizeHeight = 0,
      loginSigninButtonSizeWidth = 0,
      loginTextSize = 0;

  double paddingTextFieldEmailLeft = 0,
      paddingTextFieldEmailTop = 0,
      paddingTextFieldEmailRight = 0;

  double paddingTextFieldPasswordLeft = 0,
      paddingTextFieldPasswordTop = 0,
      paddingTextFieldPasswordRight = 0;

  void updateMeasurements({
    required Orientation orientation,
    required double height,
    required double width,
  }) {
    final double smallestSize = height < width ? height : width;
    final double summedMeasurements = (height + width);
    switch (orientation) {
      case Orientation.portrait:
        paddingMinderTextLeft = width * 0.05;
        paddingMinderTextTop = height * 0.08;
        minderTextSize = height * 0.1;

        paddingLoginButtonLeft = width * 0.05;
        paddingLoginButtonBottom = height * 0;
        loginSigninButtonSizeWidth = width * 0.66;
        loginSigninButtonSizeHeight = height * 0.07;
        loginTextSize = width * 0.1;

        paddingMinderImageLeft = width * 0.03;
        paddingMinderImageTop = height * 0.01;

        paddingTextFieldEmailLeft = width * 0.2;
        paddingTextFieldEmailTop = height * 0.25;
        paddingTextFieldEmailRight = width * 0.15;

        paddingTextFieldPasswordLeft = width * 0.2;
        paddingTextFieldPasswordTop = height * 0.02;
        paddingTextFieldPasswordRight = width * 0.15;

        break;
      case Orientation.landscape:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    updateMeasurements(
      orientation: orientation,
      height: screenHeight,
      width: screenWidth,
    );
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              paddingMinderTextLeft, paddingMinderTextTop, 0, 0),
          child: Text('Minder',
              style: GoogleFonts.fugazOne(
                  textStyle: TextStyle(
                      fontSize: minderTextSize,
                      color: Palette.minderTextColor))),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              paddingMinderImageLeft, paddingMinderImageTop, 0, 0),
          child: Image.asset('assets/images/minderIcon.png'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingTextFieldEmailLeft,
              paddingTextFieldEmailTop, paddingTextFieldEmailRight, 0),
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(105, 5, 0, 30),
                hintText: 'Email',
                hintStyle: GoogleFonts.forum(
                    textStyle: TextStyle(
                        fontSize: loginTextSize - 20,
                        color: Palette.loginTextColor)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingTextFieldPasswordLeft,
              paddingTextFieldPasswordTop, paddingTextFieldPasswordRight, 0),
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(85, 5, 0, 30),
                hintText: 'Password',
                hintStyle: GoogleFonts.forum(
                    textStyle: TextStyle(
                        fontSize: loginTextSize - 20,
                        color: Palette.loginTextColor)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                fillColor: Colors.white,
                filled: true),
            maxLength: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              paddingLoginButtonLeft, paddingLoginButtonBottom, 0, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(
                    loginSigninButtonSizeWidth, loginSigninButtonSizeHeight),
                backgroundColor: Palette.loginButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Text(
              'Login',
              style: GoogleFonts.francoisOne(
                  textStyle: TextStyle(
                      fontSize: loginTextSize,
                      color: Palette.loginButtonTextColor)),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainPage(
                    backgroundColor: Palette.backgroundColor,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(
                      backgroundColor: Palette.backgroundColor,
                    ),
                  ),
                );
              },
              child: Text(
                'Do not have an account? Signup',
                style: GoogleFonts.forum(
                    textStyle: TextStyle(
                        fontSize: loginTextSize - 25, color: Colors.blueGrey)),
              ),
            ))
      ]),
    );
  }
}
