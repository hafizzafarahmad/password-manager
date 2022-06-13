import 'dart:convert';

import 'package:antilostaccount/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:antilostaccount/features/myAccount/domain/entities/myaccount_entity.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:pigment/pigment.dart';

import 'core/styles/colors.dart';
import 'dependency_injection.dart';
import 'features/auth/presentation/pages/index_auth.dart';
import 'package:antilostaccount/dependency_injection.dart' as di;
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //set location local storage file
  var appDockumentDirectory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDockumentDirectory.path);

  //register Entity local storage
  Hive.registerAdapter(MyAccountEntityAdapter());

  //generate encryption Key when app launch for the first time
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  var containsEncryptionKey = await secureStorage.containsKey(key: 'encryptionKey');
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: 'encryptionKey', value: base64UrlEncode(key));
  }

  //initial dependency injection
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (BuildContext context) => sl<AuthBloc>()),
          BlocProvider<MyAccountBloc>(create: (BuildContext context) => sl<MyAccountBloc>()),
        ],
        child: MaterialApp(
          title: 'Anti Lost Account',
          theme: ThemeData(
            primaryColor: Pigment.fromString(primaryColor),
          ),
          home: const IndexAuth(),
        ));
  }
}
