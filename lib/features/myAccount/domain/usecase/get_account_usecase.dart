import 'package:antilostaccount/core/error/failures.dart';
import 'package:antilostaccount/core/platform/usecase.dart';
import 'package:antilostaccount/features/myAccount/data/models/myaccount_model.dart';
import 'package:antilostaccount/features/myAccount/domain/repositories/myaccount_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAccountUsecase implements UseCase<MyAccountModel, ParamsGetAccount> {
  final MyAccountRepository repository;

  GetAccountUsecase(this.repository);

  @override
  Future<Either<Failure, MyAccountModel>> call(ParamsGetAccount params) async {
    return await repository.getAccountUsecase(params);
  }
}

class ParamsGetAccount extends Equatable {
  final String? filter;
  final String? query;

  const ParamsGetAccount({this.filter, this.query});

  @override
  List<Object> get props => [filter!, query!];
}