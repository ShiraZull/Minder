import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minder/config/palette.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.backgroundColor});

  final Color backgroundColor;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    final user = FirebaseAuth.instance.currentUser!;
    updateMeasurements(
      orientation: orientation,
      height: screenHeight,
      width: screenWidth,
    );
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          child: TextFormField(),
        ),
        Text(
          'Signed In as',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          user.email!,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton.icon(
          onPressed: () => FirebaseAuth.instance.signOut(),
          icon: Icon(Icons.arrow_back, size: 36,),
          label: Text(
            'Sign Out',
            style: TextStyle(fontSize: 24),
          ),
        )
      ]),
    );
  }
}
