import 'package:flutter/material.dart';

import './screens/custom_drawer.dart';
import './screens/animation_screen.dart';
import './screens/loading_animation.dart';
import './screens/smiley_screen.dart';
import './screens/background_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CustomDrawer(),
      routes: {
        AnimationScreen.routeName : (ctx) => AnimationScreen(),
        LoadingScreen.routeName : (ctx) => LoadingScreen(),
        SmileyScreen.routeName : (ctx) => SmileyScreen(),
        BackgroundScreen.routeName: (ctx) => BackgroundScreen(),
      },
    );
  }
}
