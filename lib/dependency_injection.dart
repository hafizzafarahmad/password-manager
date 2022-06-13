


import 'dart:convert';
import 'dart:typed_data';

import 'package:antilostaccount/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:antilostaccount/features/myAccount/data/datasource/myaccount_local_data_source.dart';
import 'package:antilostaccount/features/myAccount/data/repositories/myaccount_repository_impl.dart';
import 'package:antilostaccount/features/myAccount/domain/repositories/myaccount_repository.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/add_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/delete_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/edit_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/get_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  ///to get encryption Key
  final key = await secureStorage.read(key: 'encryptionKey');
  Uint8List encryptionKey = base64Url.decode(key!);

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => encryptionKey);

  ///BLOC ------------------------------------------------------------------
  ///AUTH
  sl.registerFactory(() => AuthBloc(sharedPreferences: sl()));
  ///ACCOUNT
  sl.registerFactory(() => MyAccountBloc(
    addAccountUsecase: sl(),
    getAccountUsecase: sl(),
    deleteAccountUsecase: sl(),
    editAccountUsecase: sl()
  ));


  ///USE CASE ------------------------------------------------------------------
  sl.registerLazySingleton(() => GetAccountUsecase(sl()));
  sl.registerLazySingleton(() => AddAccountUsecase(sl()));
  sl.registerLazySingleton(() => DeleteAccountUsecase(sl()));
  sl.registerLazySingleton(() => EditAccountUsecase(sl()));

  /// REPOSITORY ---------------------------------------------------------------
  sl.registerLazySingleton<MyAccountRepository>(
    () => MyAccountRepositoryImpl(
      myAccountLocalDataSource: sl(),
    ),
  );

  ///DATA SOURCES LOCAL--------------------------------------------------------------
  sl.registerLazySingleton<MyAccountLocalDataSource>(
        () => MyAccountLocalDataSourceImpl(encryptionKey: sl()));

}
