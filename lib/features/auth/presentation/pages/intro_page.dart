import 'package:antilostaccount/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:antilostaccount/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}


class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  static const pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    titlePadding: EdgeInsets.only(top: 20),
    bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  Widget _buildImage(String assetName, {double width = 350}) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Manage Account",
          body:
          "All your account in one place. Safe, secure and encrypted",
          image: _buildImage('image2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Authentication",
          body:
          "Your data is protected by end to end fingerprint.",
          image: _buildImage('image1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Without Internet Connection",
          body:
          "All your data store in encrypted local storage.",
          image: _buildImage('image3.png', width: 250),
          decoration: pageDecoration,
        ),
      ],
      onDone: (){
        context.read<AuthBloc>().add(IntroDone());
      },
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
