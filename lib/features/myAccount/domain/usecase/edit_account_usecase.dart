
import 'package:antilostaccount/core/error/failures.dart';
import 'package:antilostaccount/core/platform/base_model.dart';
import 'package:antilostaccount/core/platform/usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/repositories/myaccount_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EditAccountUsecase implements UseCase<BaseModel, ParamsEditAccount> {
  final MyAccountRepository repository;

  EditAccountUsecase(this.repository);

  @override
  Future<Either<Failure, BaseModel>> call(ParamsEditAccount params) async {
    return await repository.editAccountUsecase(params);
  }
}

class ParamsEditAccount extends Equatable {
  final String id;
  final String name;
  final String username;
  final String password;
  final String category;

  const ParamsEditAccount({required this.id, required this.name, required this.username, required this.password, required this.category});

  @override
  List<Object> get props => [id, name, username, password, category];
}