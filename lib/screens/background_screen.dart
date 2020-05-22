import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class BackgroundScreen extends StatefulWidget {
  static const routeName = 'background-screen';

  @override
  _BackgroundScreenState createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  final lightThemeBgColorGradient = const [
    Color(0xFFF4F5F9),
    Color(0xFFCEF4F3),
    Color(0xFFD0E2F0),
    Color(0xFFE2E1F4),
  ];

  final lightThemeVectorsColor = Colors.black;

  final darkThemeBgColorGradient = const [Color(0xFF000024), Color(0xFF000024)];

  final darkThemeVectorsColor = Color(0xFFF8F8F8);

  String _theme = 'light';

  void _changeTheme() {
    setState(() {
      if(_theme == 'light') {
        _theme = 'dark';
      } else {
        _theme = 'light';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _theme == 'light'
                ? lightThemeBgColorGradient
                : darkThemeBgColorGradient,
          ),
        ),
        child: FlareActor(
          'assets/flare/background.flr',
          fit: BoxFit.cover,
          alignment: Alignment.center,
          animation: 'animate',
          color: _theme == 'light' ? lightThemeVectorsColor : darkThemeVectorsColor,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeTheme,
        child: Icon(
          Icons.scatter_plot,
          color: _theme == 'light' ? Colors.white : Colors.black,
        ),
        backgroundColor: _theme == 'light' ? Colors.black : Colors.white,
      ),
    );
  }
}
