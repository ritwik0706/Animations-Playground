import 'dart:math';

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = 'loading-screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var forward = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading...')),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (ctx, ch) {
            var angle1 = _animationController.value * pi * 8;
            var angle2 = _animationController.value * pi * 4;
            return Container(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Center(
                    child: Transform.rotate(
                      angle: angle1,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Center(
                    child: Transform.rotate(
                      angle: angle2,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (forward) {
            _animationController.forward();
            forward = false;
          } else {
            _animationController.reverse();
            forward = true;
          }
        },
        child: Icon(Icons.scatter_plot),
      ),
    );
  }
}
