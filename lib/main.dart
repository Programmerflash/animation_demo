import 'package:demo_animation_challenge/pages/first_animation.dart';
import 'package:demo_animation_challenge/pages/second_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Animation Demo')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<FirstAnimationPage>(
                        builder: (_) => FirstAnimationPage())),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: 250,
                  color: Colors.red,
                  child: Text('First Animation'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<SecondAnimationPage>(
                        builder: (_) => SecondAnimationPage())),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: 250,
                  color: Colors.green,
                  child: Text('Second Animation'),
                ),
              ),
            ]),
      ),
    );
  }
}
