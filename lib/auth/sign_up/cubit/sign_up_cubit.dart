import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_bros_flutter/auth/auth_bloc/auth_cubit.dart';
import 'package:my_bros_flutter/data_access/data_access.dart';
import 'package:my_bros_flutter/shared/app_util.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthAbstractRepository _authRepo;
  final AuthCubit _authCubit;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  factory SignUpCubit({
    required GlobalKey<NavigatorState> navigatorKey,
    required AuthAbstractRepository authRepo,
    required AuthCubit authCubit,
  }) =>
      SignUpCubit._(
          navigatorKey,
          authRepo,
          authCubit,
          GlobalKey<FormState>(),
          TextEditingController(),
          TextEditingController(),
          TextEditingController());

  SignUpCubit._(
      this._navigatorKey,
      this._authRepo,
      this._authCubit,
      this._formKey,
      this._emailController,
      this._passwordController,
      this._confirmPasswordController)
      : super(SignUpState.initial(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            loading: false));

  Future<void> signUp() async {
    final state = this.state;
    final overlayContext = _navigatorKey.currentState!.overlay!.context;
    if (_formKey.currentState!.validate()) {
      emit(state.copyWith(loading: true));
      try {
        final user = await _authRepo.signUpWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        _authCubit.didAuthenticate(user: user!);
      } catch (e) {
        appShowErrorDialog(overlayContext, e);
      } finally {
        emit(state.copyWith(loading: false));
      }
    } else {
      // CUONG.TRUONG on January/04/2022: Do nothing if inputs are invalid
      return;
    }
  }

  void popBackToSignIn() => _navigatorKey.currentState!.maybePop();
}
