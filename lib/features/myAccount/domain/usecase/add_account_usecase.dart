
import 'package:antilostaccount/core/error/failures.dart';
import 'package:antilostaccount/core/platform/base_model.dart';
import 'package:antilostaccount/core/platform/usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/repositories/myaccount_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddAccountUsecase implements UseCase<BaseModel, ParamsAddAccount> {
  final MyAccountRepository repository;

  AddAccountUsecase(this.repository);

  @override
  Future<Either<Failure, BaseModel>> call(ParamsAddAccount params) async {
    return await repository.addAccountUsecase(params);
  }
}

class ParamsAddAccount extends Equatable {
  final String name;
  final String username;
  final String password;
  final String category;

  const ParamsAddAccount({required this.name, required this.username, required this.password, required this.category});

  @override
  List<Object> get props => [name, username, password, category];
}