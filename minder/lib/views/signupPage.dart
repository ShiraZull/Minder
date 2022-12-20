import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minder/views/loginPage.dart';
import '/config/size_utils.dart';
import '/config/color_constant.dart';
import '../config/palette.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.backgroundColor});

  final Color backgroundColor;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  double paddingMinderTextLeft = 0,
      paddingMinderTextTop = 0,
      minderTextSize = 0,
      paddingMinderImageLeft = 0,
      paddingMinderImageTop = 0,
      paddingLoginButtonLeft = 0,
      paddingLoginButtonBottom = 0,
      loginSigninButtonSizeHeight = 0,
      loginSigninButtonSizeWidth = 0,
      signupTextSize = 0;

  double paddingTextFieldUsernameLeft = 0,
      paddingTextFieldUsernameTop = 0,
      paddingTextFieldUsernameRight = 0;

  double paddingTextFieldPasswordLeft = 0,
      paddingTextFieldPasswordTop = 0,
      paddingTextFieldPasswordRight = 0;

  double paddingTextFieldEmailLeft = 0,
      paddingTextFieldEmailTop = 0,
      paddingTextFieldEmailRight = 0;

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
        signupTextSize = width * 0.1;

        paddingMinderImageLeft = width * 0.03;
        paddingMinderImageTop = height * 0.01;

        paddingTextFieldEmailLeft = width * 0.2;
        paddingTextFieldEmailTop = height * 0.15;
        paddingTextFieldEmailRight = width * 0.15;

        paddingTextFieldUsernameLeft = width * 0.2;
        paddingTextFieldUsernameTop = height * 0.02;
        paddingTextFieldUsernameRight = width * 0.15;

        paddingTextFieldPasswordLeft = width * 0.2;
        paddingTextFieldPasswordTop = height * 0;
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
            Padding(
              padding: getPadding(left: 2, top: 150),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(50, 5, 0, 25),
                    hintText: 'Email',
                    hintStyle: GoogleFonts.forum(
                        textStyle: TextStyle(
                            fontSize: signupTextSize - 20,
                            color: Palette.loginTextColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: getPadding(left: 2, top: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(50, 5, 0, 25),
                    hintText: 'Username',
                    hintStyle: GoogleFonts.forum(
                        textStyle: TextStyle(
                            fontSize: signupTextSize - 20,
                            color: Palette.loginTextColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true),
                maxLength: 15,
              ),
            ),
            Padding(
              padding: getPadding(left: 2, top: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(50, 5, 0, 25),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.forum(
                        textStyle: TextStyle(
                            fontSize: signupTextSize - 20,
                            color: Palette.loginTextColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true),
                maxLength: 20,
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(
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
                          child: Text("Signup",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.francoisOne(
                                  textStyle: TextStyle(
                                      fontSize: signupTextSize,
                                      color: Palette.loginButtonTextColor))))
                    ]))),
          ],
        ),
      ),
    );
  }
}
