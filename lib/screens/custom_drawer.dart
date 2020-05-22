import 'package:animation_playground/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _toggleAnimationController() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  var myDrawer = AppDrawer();
  var maxScale = 0.5;
  var maxTranslate = 300.0;
  bool _canBeDragged = false;

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromleft =
        _animationController.isDismissed && details.globalPosition.dx < 50.0;
    bool isDragCloseFromRight =
        _animationController.isCompleted && details.globalPosition.dx > maxTranslate * 0.7;

    _canBeDragged = isDragOpenFromleft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxTranslate;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity =
          details.velocity.pixelsPerSecond.dx / maxTranslate;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      _animationController.value = 0;
    } else {
      _animationController.value = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    maxTranslate = MediaQuery.of(context).size.width;
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      // onTapDown: ,
      // onTap: _toggleAnimationController,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (ctx, ch) {
          double translate = maxTranslate * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            children: [
              myDrawer,
              Transform(
                transform: Matrix4.identity()
                  ..scale(scale)
                  ..translate(translate),
                child: HomeScreen(_toggleAnimationController),
                alignment: Alignment.centerLeft,
              ),
            ],
          );
        },
      ),
    );
  }
}
