
import 'package:antilostaccount/core/error/failures.dart';
import 'package:antilostaccount/core/platform/base_model.dart';
import 'package:antilostaccount/core/platform/usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/repositories/myaccount_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeleteAccountUsecase implements UseCase<BaseModel, ParamsDeleteAccount> {
  final MyAccountRepository repository;

  DeleteAccountUsecase(this.repository);

  @override
  Future<Either<Failure, BaseModel>> call(ParamsDeleteAccount params) async {
    return await repository.deleteAccountUsecase(params);
  }
}

class ParamsDeleteAccount extends Equatable {
  final String id;

  const ParamsDeleteAccount({required this.id});

  @override
  List<Object> get props => [id];
}