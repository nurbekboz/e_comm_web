import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  // ignore: missing_return
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

//Color(0xfff5e40a4) mor rengimiz
//3949ab
  static ThemeData get lightTheme {
    return ThemeData(
      cardColor: Colors.white,
      secondaryHeaderColor: Colors.white60,
      primaryColor: Colors.black,
      hintColor: Color(0xfff012BFF),
      canvasColor: Colors.black,
      primaryColorLight: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontFamily: "Arial",
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontFamily: "Arial",
        ),
        bodyText1: TextStyle(
          color: Colors.white70,
          fontFamily: "Arial",
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontFamily: "Arial",
        ),
      ),
    );
  }

//171717
  static ThemeData get darkTheme {
    return ThemeData(
      secondaryHeaderColor: Colors.white60,
      cardColor: Color(0xfff171717),
      primaryColorLight: Colors.white,
      primaryColor: Colors.black,
      hintColor: Colors.black,
      canvasColor: Color(0xfff54a8c7),
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Color(0xfff171717),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Color(0xfff54a8c7),
          fontFamily: "Arial",
        ),
        headline2: TextStyle(
          color: Color(0xfff54a8c7),
          fontFamily: "Arial",
        ),
        bodyText1: TextStyle(
          color: Color(0xfff54a8c7),
          fontFamily: "Arial",
        ),
        bodyText2: TextStyle(
          color: Color(0xfff54a8c7),
          fontFamily: "Arial",
        ),
      ),
    );
  }
}
