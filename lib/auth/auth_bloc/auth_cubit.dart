import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_bros_flutter/data_access/data_access.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthAbstractRepository authRepo;
  AuthCubit({required this.authRepo}) : super(const AuthState.unknown()) {
    checkingSession();
  }

  Future<void> checkingSession() async {
    // CUONG.TRUONG on January/03/2022: a reasonable delay
    await Future.delayed(const Duration(milliseconds: 2000));
    emit(const AuthState.unauthenticated());
  }

  Future<void> didAuthenticate({required User user}) async {
    emit(AuthState.authenticated(user: user));
  }

  Future<void> logOut() async {
    await authRepo.signOut();
    debugPrint('Firebase AUTH signed out');
    emit(const AuthState.unauthenticated());
  }
}
