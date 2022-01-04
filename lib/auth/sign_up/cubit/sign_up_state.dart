part of 'sign_up_cubit.dart';

@Freezed()
abstract class SignUpState with _$SignUpState {
  const factory SignUpState.initial({
    required GlobalKey formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required bool loading,
  }) = SignUpStateInitial;
}
