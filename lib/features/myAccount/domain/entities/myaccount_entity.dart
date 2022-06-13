import 'package:antilostaccount/core/database/hive_database.dart';
import 'package:hive/hive.dart';
part 'myaccount_entity.g.dart';

///

///typeid is unique
@HiveType(typeId: typeMyAccountHive)
class MyAccountEntity{
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String password;
  @HiveField(4)
  String category;

  MyAccountEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.category
  });

}