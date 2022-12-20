import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minder/config/palette.dart';
import 'package:minder/views/loginPage.dart';
import 'package:minder/views/signupPage.dart';
import '/config/size_utils.dart';
import '/config/color_constant.dart';
import 'mainPage.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key, required Color backgroundColor});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  double paddingMinderTextLeft = 0,
      paddingMinderTextTop = 0,
      minderTextSize = 0,
      paddingMinderImageLeft = 0,
      paddingMinderImageTop = 0,
      paddingLoginButtonLeft = 0,
      paddingLoginButtonBottom = 0,
      paddingSignupButtonBottom = 0,
      loginSigninButtonSizeHeight = 0,
      loginSigninButtonSizeWidth = 0,
      loginTextSize = 0;

  void updateMeasurements({
    required Orientation orientation,
    required double height,
    required double width,
  }) {
    final double smallestSize = height < width ? height : width;
    final double summedMeasurements = (height + width);
    switch (orientation) {
      case Orientation.portrait:
        paddingMinderTextLeft = width * 0.2;
        paddingMinderTextTop = height * 0.08;
        minderTextSize = height * 0.1;

        paddingLoginButtonLeft = width * 0.15;
        paddingLoginButtonBottom = height * 0.4;
        loginSigninButtonSizeWidth = width * 0.66;
        loginSigninButtonSizeHeight = height * 0.07;
        loginTextSize = width * 0.1;

        paddingSignupButtonBottom = height * 0.02;

        paddingMinderImageLeft = width * 0.1;
        paddingMinderImageTop = height * 0.01;

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
      backgroundColor: Palette.backgroundColor,
      body: Container(
        width: size.width,
        padding: getPadding(left: 46, top: 76, right: 46),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(top: 50),
              child: Text('Minder',
                  style: GoogleFonts.fugazOne(
                      textStyle: TextStyle(
                          fontSize: minderTextSize,
                          color: Palette.minderTextColor))),
            ),
            Padding(
              padding: getPadding(top: 20),
              child: Image.asset('assets/images/minderIcon.png'),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return const MainPage(
                              backgroundColor: Palette.backgroundColor,
                            );
                          } else {
                            return const LoginPage(
                              backgroundColor: Palette.backgroundColor,
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                    height: getVerticalSize(64.00),
                    width: getHorizontalSize(296.00),
                    margin: getMargin(top: 260),
                    child: Stack(alignment: Alignment.topRight, children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              height: getVerticalSize(65.00),
                              width: getHorizontalSize(90.00),
                              decoration: BoxDecoration(
                                  color: ColorConstant.blueGray900,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(36.00))))),
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              height: getVerticalSize(65.00),
                              width: getHorizontalSize(90.00),
                              decoration: BoxDecoration(
                                  color: ColorConstant.blueGray900,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(36.00))))),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              height: getVerticalSize(65.00),
                              width: getHorizontalSize(223.00),
                              decoration: BoxDecoration(
                                  color: ColorConstant.blueGray900))),
                      Align(
                          alignment: Alignment.center,
                          child: Text("Login",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.francoisOne(
                                  textStyle: TextStyle(
                                      fontSize: loginTextSize - 3,
                                      color: Palette.loginButtonTextColor))))
                    ]))),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(
                        backgroundColor: Palette.backgroundColor,
                      ),
                    ),
                  );
                },
                child: Container(
                    height: getVerticalSize(64.00),
                    width: getHorizontalSize(296.00),
                    margin: getMargin(top: 14),
                    child: Stack(alignment: Alignment.topRight, children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              height: getVerticalSize(65.00),
                              width: getHorizontalSize(90.00),
                              decoration: BoxDecoration(
                                  color: Palette.signupButtonColor,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(36.00))))),
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              height: getVerticalSize(65.00),
                              width: getHorizontalSize(90.00),
                              decoration: BoxDecoration(
                                  color: Palette.signupButtonColor,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(36.00))))),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              height: getVerticalSize(65.00),
                              width: getHorizontalSize(223.00),
                              decoration: const BoxDecoration(
                                  color: Palette.signupButtonColor))),
                      Align(
                          alignment: Alignment.center,
                          child: Text("Signup",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.francoisOne(
                                  textStyle: TextStyle(
                                      fontSize: loginTextSize - 3,
                                      color: Palette.loginButtonTextColor))))
                    ]))),
          ],
        ),
      ),
    );
  }
}
