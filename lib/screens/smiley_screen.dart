import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SmileyScreen extends StatefulWidget {
  static const routeName = 'smiley-screen';

  @override
  _SmileyScreenState createState() => _SmileyScreenState();
}

class _SmileyScreenState extends State<SmileyScreen> {
  String _animationName = 'smile';
  void _changeAnimation() {
    setState(() {
      if (_animationName == 'smile') {
        _animationName = 'frown';
      } else {
        _animationName = 'smile';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smiley'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: FlareActor(
            'assets/flare/smiley_frown.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: _animationName,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeAnimation,
        child: Icon(Icons.scatter_plot),
      ),
    );
  }
}
