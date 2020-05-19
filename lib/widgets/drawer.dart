import 'package:flutter/material.dart';

import '../screens/loading_animation.dart';
import '../screens/animation_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scW = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue,
      width: scW,
      child: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Animation \nPlayground',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              ListTile(
                title: Text(
                  '3D drawer',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.threed_rotation,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Loading Style',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.adjust,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(LoadingScreen.routeName);
                },
              ),
              ListTile(
                title: Text(
                  'Experiments',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.mood_bad,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(AnimationScreen.routeName);
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
