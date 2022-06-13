import 'package:antilostaccount/core/error/exception.dart';
import 'package:antilostaccount/core/error/failures.dart';
import 'package:antilostaccount/core/platform/base_model.dart';
import 'package:antilostaccount/features/myAccount/data/datasource/myaccount_local_data_source.dart';
import 'package:antilostaccount/features/myAccount/data/models/myaccount_model.dart';
import 'package:antilostaccount/features/myAccount/domain/repositories/myaccount_repository.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/add_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/delete_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/edit_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/get_account_usecase.dart';
import 'package:dartz/dartz.dart';

class MyAccountRepositoryImpl implements MyAccountRepository{

  final MyAccountLocalDataSource myAccountLocalDataSource;

  MyAccountRepositoryImpl({required this.myAccountLocalDataSource});

  ///Functional programming in Dart using dartz
  ///Either: Left if return fail, Right if return success

  @override
  Future<Either<Failure, BaseModel>> addAccountUsecase(ParamsAddAccount paramsAddAccount) async {
    try{
      final local = await myAccountLocalDataSource.addAccount(paramsAddAccount);

      return Right(BaseModel(status: "success"));
    }on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, MyAccountModel>> getAccountUsecase(ParamsGetAccount paramsGetAccount) async {
    try{
      final local = await myAccountLocalDataSource.getAccount(paramsGetAccount);

      return Right(local);
    }on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, BaseModel>> deleteAccountUsecase(ParamsDeleteAccount paramsDeleteAccount) async {
    try{
      final local = await myAccountLocalDataSource.deleteAccount(paramsDeleteAccount);

      return Right(BaseModel(status: "success"));
    }on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, BaseModel>> editAccountUsecase(ParamsEditAccount paramsEditAccount) async {
    try{
      final local = await myAccountLocalDataSource.editAccount(paramsEditAccount);

      return Right(BaseModel(status: "success"));
    }on CacheException{
      return Left(CacheFailure());
    }
  }

}