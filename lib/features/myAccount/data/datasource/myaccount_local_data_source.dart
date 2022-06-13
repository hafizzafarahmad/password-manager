import 'dart:convert';
import 'dart:typed_data';

import 'package:antilostaccount/core/database/hive_database.dart';
import 'package:antilostaccount/features/myAccount/data/models/myaccount_model.dart';
import 'package:antilostaccount/features/myAccount/domain/entities/myaccount_entity.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/add_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/delete_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/edit_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/get_account_usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

abstract class MyAccountLocalDataSource {
  Future addAccount(ParamsAddAccount params);
  Future editAccount(ParamsEditAccount params);
  Future deleteAccount(ParamsDeleteAccount params);
  Future<MyAccountModel> getAccount(ParamsGetAccount paramsGetAccount);
}

class MyAccountLocalDataSourceImpl implements MyAccountLocalDataSource{
  final Uint8List encryptionKey;

  MyAccountLocalDataSourceImpl({required this.encryptionKey});

  @override
  Future addAccount(ParamsAddAccount params) async {
    //open local storage with encryption Key
    var box = await Hive.openBox(boxMyAccountHive, encryptionCipher: HiveAesCipher(encryptionKey));

    //generate unique id
    String uuid = const Uuid().v4();

    //insert into local storage
    box.add(MyAccountEntity(
      id: uuid,
      name: params.name,
      username: params.username,
      password: params.password,
      category: params.category)
    );

  }

  @override
  Future<MyAccountModel> getAccount(ParamsGetAccount params) async {
    //open local storage with encryption Key
    var box = await Hive.openBox(boxMyAccountHive, encryptionCipher: HiveAesCipher(encryptionKey));

    List<MyAccountEntity> list = [];

    for(int i=0; i < box.length; i++){
      list.add(box.getAt(i));
    }

    //search data by category
    if(params.filter != null){
      list = list.where((element) => element.category.toLowerCase() == params.filter!.toLowerCase()).toList();
    }

    //search data by name
    if(params.query != null){
      list = list.where((element) => element.name.toLowerCase().contains(params.query!.toLowerCase())).toList();
    }

    return MyAccountModel(list);
  }

  @override
  Future deleteAccount(ParamsDeleteAccount params) async {
    //open local storage with encryption Key
    var box = await Hive.openBox(boxMyAccountHive, encryptionCipher: HiveAesCipher(encryptionKey));

    List<MyAccountEntity> list = [];

    for(int i=0; i < box.length; i++){
      list.add(box.getAt(i));
    }

    //search index by id
    int index = list.indexWhere((element) => element.id == params.id);

    //delete data local storage
    box.deleteAt(index);
  }

  @override
  Future editAccount(ParamsEditAccount params) async {
    //open local storage with encryption Key
    var box = await Hive.openBox(boxMyAccountHive, encryptionCipher: HiveAesCipher(encryptionKey));

    List<MyAccountEntity> list = [];

    for(int i=0; i < box.length; i++){
      list.add(box.getAt(i));
    }

    //search index by id
    int index = list.indexWhere((element) => element.id == params.id);

    //update data local storage
    box.putAt(index, MyAccountEntity(
        id: params.id,
        name: params.name,
        username: params.username,
        password: params.password,
        category: params.category
    ));
  }

}