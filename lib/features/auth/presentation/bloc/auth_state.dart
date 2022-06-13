
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialized extends AuthState {}

class AuthIntro extends AuthState {}

class Authenticated extends AuthState {}

class NeedAuthenticated extends AuthState {}