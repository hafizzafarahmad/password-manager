
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent{
  final BuildContext context;

  AppStarted(this.context);

  @override
  List<Object> get props => [context];
}

class IntroDone extends AuthEvent{}

class ScanFingerEvent extends AuthEvent {}