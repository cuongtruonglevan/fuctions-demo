part of 'sign_in_cubit.dart';

@Freezed()
abstract class SignInState with _$SignInState {
  const factory SignInState.initial({
    required GlobalKey formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required bool loading,
  }) = SignInStateInitial;
}
