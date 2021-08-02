import 'package:flutter/material.dart';
import 'package:slider_2_builder/view/home/home_view.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel 2 Builder',
      routes: {
        '/' : (context) => HomeView(),
      },
    );
  }
}