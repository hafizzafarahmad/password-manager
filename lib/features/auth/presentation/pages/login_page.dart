import 'package:antilostaccount/core/styles/colors.dart';
import 'package:antilostaccount/core/styles/size.dart';
import 'package:antilostaccount/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:antilostaccount/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _signInd() async {
    bool authenticated = false;
    // try {
    //   //fingerprint authenticate
    //   authenticated = await auth.authenticate(
    //     localizedReason:
    //     'Scan your fingerprint to authenticate',
    //     options: const AuthenticationOptions(
    //       useErrorDialogs: true,
    //       stickyAuth: true,
    //       biometricOnly: true,
    //     ),
    //   );
    // } on PlatformException catch (e) {
    //   return;
    // }
    // if (!mounted) {
    //   return;
    // }

    //if success redirect to home screen
    if(true){
      context.read<AuthBloc>().add(ScanFingerEvent());
    }

    debugPrint(authenticated.toString());
  }

  @override
  void initState() {
    _signInd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: autoSizedWidth(context, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Image.asset("assets/fingerprint.png", width: autoSizedWidth(context, 0.3),),
                const SizedBox(height: 20,),
                Text("One-Touch Sign In",
                  style: TextStyle(
                      fontSize:  autoSizedWidth(context, 0.055)
                  ),
                ),
                const SizedBox(height: 30,),
                Text("Please place your fingertip on the scanner to verify your identity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize:  autoSizedWidth(context, 0.04)
                  ),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    _signInd();
                  },
                  child: Text("Sign In",
                    style: TextStyle(
                        color: Pigment.fromString(primaryColor),
                        fontSize: 18
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      side:  BorderSide(width: 3, color: Pigment.fromString(primaryColor),),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      primary: Colors.white,
                      shadowColor: Colors.white
                  ),

                )
              ],
            ),
            Text("(Fingerprint sign in makes your app login much faster. Your device"
                " should have at least one fingerprint registered in device setting.)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize:  autoSizedWidth(context, 0.035)
              ),
            ),
          ],
        )
      )
    );
  }
}
