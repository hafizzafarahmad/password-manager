
import 'package:antilostaccount/features/myAccount/domain/usecase/add_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/delete_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/edit_account_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyAccountEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddAccountEvent extends MyAccountEvent{
  final BuildContext context;
  final ParamsAddAccount paramsAddAccount;

  AddAccountEvent( { required this.context,required this.paramsAddAccount});

  @override
  List<Object> get props => [paramsAddAccount];
}

class GetAccountEvent extends MyAccountEvent{
  late final String? filter;
  late final String? query;

  GetAccountEvent( {this.filter, this.query});

  @override
  List<Object> get props => [filter!, query!];
}

class EditAccountEvent extends MyAccountEvent{
  final BuildContext context;
  final ParamsEditAccount paramsEditAccount;

  EditAccountEvent( { required this.context,required this.paramsEditAccount});

  @override
  List<Object> get props => [paramsEditAccount];
}

class DeleteAccountEvent extends MyAccountEvent{
  final BuildContext context;
  final ParamsDeleteAccount paramsDeleteAccount;

  DeleteAccountEvent( { required this.context, required this.paramsDeleteAccount});

  @override
  List<Object> get props => [paramsDeleteAccount];
}