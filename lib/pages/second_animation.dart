import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondAnimationPage extends StatefulWidget {
  const SecondAnimationPage({Key? key}) : super(key: key);

  @override
  State<SecondAnimationPage> createState() => _SecondAnimationPageState();
}

class _SecondAnimationPageState extends State<SecondAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
