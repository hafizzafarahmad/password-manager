import 'package:antilostaccount/core/error/failures.dart';
import 'package:antilostaccount/core/platform/base_model.dart';
import 'package:antilostaccount/features/myAccount/data/models/myaccount_model.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/add_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/delete_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/edit_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/get_account_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class MyAccountRepository {
  Future<Either<Failure, BaseModel>> addAccountUsecase(ParamsAddAccount paramsAddAccount);
  Future<Either<Failure, MyAccountModel>> getAccountUsecase(ParamsGetAccount paramsGetAccount);
  Future<Either<Failure, BaseModel>> editAccountUsecase(ParamsEditAccount paramsEditAccount);
  Future<Either<Failure, BaseModel>> deleteAccountUsecase(ParamsDeleteAccount paramsDeleteAccount);

}