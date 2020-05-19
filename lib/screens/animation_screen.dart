import 'dart:math';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  static const routeName = '/exp-screen';
  const AnimationScreen({Key key}) : super(key: key);

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var forward = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    // _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiments'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (ctx, ch) => Transform.rotate(
            angle: _animationController.value * 2 * pi,
            child: ch,
          ),
          child: Container(
            height: 200,
            width: 200,
            color: Colors.lightGreenAccent,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.cyan,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.brown,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                )
              ],
            ),
          ),
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
