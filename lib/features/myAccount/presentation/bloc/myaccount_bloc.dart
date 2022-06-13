
import 'package:antilostaccount/core/platform/usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/add_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/delete_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/edit_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/get_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_event.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountBloc extends Bloc<MyAccountEvent, MyAccountState>{
  final AddAccountUsecase addAccountUsecase;
  final GetAccountUsecase getAccountUsecase;
  final DeleteAccountUsecase deleteAccountUsecase;
  final EditAccountUsecase editAccountUsecase;
  MyAccountBloc({
    required this.deleteAccountUsecase,
    required this.editAccountUsecase,
    required this.addAccountUsecase,
    required this.getAccountUsecase
  }) : super(MyAccountLoadingState());

  @override
  Stream<MyAccountState> mapEventToState(MyAccountEvent event) async* {

    if(event is AddAccountEvent){

      final result = await addAccountUsecase(event.paramsAddAccount);

      yield* result.fold((l) async* {
        yield MyAccountErrorState();
      }, (r)async*{
        event.context.read<MyAccountBloc>().add(GetAccountEvent());
        Navigator.pop(event.context);
      });
    }

    if(event is GetAccountEvent){
      yield MyAccountLoadingState();
      final result = await getAccountUsecase(ParamsGetAccount(
        filter: event.filter,
        query: event.query
      ));
      yield* result.fold((l) async* {
        yield MyAccountErrorState();
      }, (r)async*{
        yield MyAccountListState(list: r.list);
      });
    }

    if(event is EditAccountEvent){
      final result = await editAccountUsecase(event.paramsEditAccount);
      yield* result.fold((l) async* {
        yield MyAccountErrorState();
      }, (r)async*{
        event.context.read<MyAccountBloc>().add(GetAccountEvent());
        Navigator.pop(event.context);
      });
    }

    if(event is DeleteAccountEvent){
      final result = await deleteAccountUsecase(event.paramsDeleteAccount);
      yield* result.fold((l) async* {
        yield MyAccountErrorState();
      }, (r)async*{
        event.context.read<MyAccountBloc>().add(GetAccountEvent());
        Navigator.pop(event.context);
      });
    }
  }

}

