import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function _animationHandler;
  HomeScreen(this._animationHandler);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.menu,
          ),
          onTap: _animationHandler,
        ),
        title: Text('Animations'),
      ),
      body: Center(
        child: Text('Click on the drawer Icon to view animations.'),
      ),
    );
  }
}
