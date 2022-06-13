import 'package:antilostaccount/features/myAccount/domain/entities/myaccount_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyAccountState extends Equatable {
  @override
  List<Object> get props => [];
}

class MyAccountListState extends MyAccountState {
  final List<MyAccountEntity> list;

  MyAccountListState({required this.list});
}

class MyAccountErrorState extends MyAccountState {}

class MyAccountLoadingState extends MyAccountState {}