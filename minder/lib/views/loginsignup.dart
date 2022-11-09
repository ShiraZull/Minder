import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minder/config/palette.dart';
import 'package:minder/views/loginPage.dart';

class loginsignup extends StatefulWidget {
  const loginsignup({super.key});

  @override
  State<loginsignup> createState() => _loginsignupState();
}

class _loginsignupState extends State<loginsignup> {
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

        paddingLoginButtonLeft = width * 0.2;
        paddingLoginButtonBottom = height * 0.7;
        loginSigninButtonSizeWidth = width * 0.66;
        loginSigninButtonSizeHeight = height * 0.07;
        loginTextSize = width * 0.1;

        paddingSignupButtonBottom = height * 0.8;

        paddingMinderImageLeft = width * 0.43;
        paddingMinderImageTop = height * 0.26;

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
    print(paddingMinderTextLeft);
    print(paddingMinderTextTop);
    print(minderTextSize);
    print(paddingLoginButtonBottom);
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
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
            child: Image.asset('assets/images/minderImage.png'),
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
                style: GoogleFonts.fugazOne(
                    textStyle: TextStyle(
                        fontSize: loginTextSize,
                        color: Palette.loginTextColor)),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(
                      backgroundColor: Palette.backgroundColor,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                paddingLoginButtonLeft, paddingSignupButtonBottom, 0, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                      loginSigninButtonSizeWidth, loginSigninButtonSizeHeight),
                  backgroundColor: Palette.signupButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                'Signup',
                style: GoogleFonts.fugazOne(
                    textStyle: TextStyle(
                        fontSize: loginTextSize,
                        color: Palette.loginTextColor)),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
