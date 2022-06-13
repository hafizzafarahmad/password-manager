import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);


  @override
  _SplashScreenPage createState() => _SplashScreenPage();
}

class _SplashScreenPage extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Center(
            child:  Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              width: 200,
            ),
          )
        ],
      ),
    );
  }

}