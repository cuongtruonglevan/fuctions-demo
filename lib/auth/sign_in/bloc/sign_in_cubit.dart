import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_bros_flutter/auth/auth_bloc/auth_cubit.dart';
import 'package:my_bros_flutter/data_access/data_access.dart';
import 'package:my_bros_flutter/shared/app_util.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthAbstractRepository _authRepo;
  final AuthCubit _authCubit;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  factory SignInCubit(
          {required GlobalKey<NavigatorState> navigatorKey,
          required AuthAbstractRepository authRepo,
          required AuthCubit authCubit}) =>
      SignInCubit._(
        navigatorKey,
        authRepo,
        authCubit,
        GlobalKey(),
        TextEditingController(),
        TextEditingController(),
      );

  SignInCubit._(this._navigatorKey, this._authRepo, this._authCubit,
      this._formKey, this._emailController, this._passwordController)
      : super(
          SignInState.initial(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              loading: false),
        );

  Future<void> signIn() async {
    final state = this.state;
    if (!_formKey.currentState!.validate()) {
      // CUONG.TRUONG on January/03/2022: Do nothing if inputs are empty
      return;
    }
    emit(state.copyWith(loading: true));
    try {
      final user = await _authRepo.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      _authCubit.didAuthenticate(user: user!);
    } catch (e) {
      String _errorMessage = e.toString();
      if (e is FirebaseException) {
        _errorMessage = e.message!;
      }
      appShowAlertDialog(_navigatorKey.currentState!.overlay!.context,
          title: 'Error', alertMessage: _errorMessage);
      emit(state);
    }
  }
}
