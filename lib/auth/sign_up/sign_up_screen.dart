import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bros_flutter/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:my_bros_flutter/shared/app_widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.blueGrey[300],
          body: Form(
            key: state.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FlutterLogo(
                            size: 200.0,
                            style: FlutterLogoStyle.stacked,
                            textColor: Colors.white,
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: Image.network(
                              'https://firebase.google.com/downloads/brand-guidelines/PNG/logo-built_black.png',
                              width: 200.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: state.emailController,
                      enabled: !state.loading,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) return 'Please enter some text';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: state.passwordController,
                      enabled: !state.loading,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) return 'Please enter some text';
                        return null;
                      },
                      obscureText: true,
                    ),
                    TextFormField(
                      controller: state.confirmPasswordController,
                      enabled: !state.loading,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (String? value) {
                        if (value != state.passwordController.text) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 100.0),
                    AppLoadingButton(
                      showLoading: true,
                      disabled: state.loading,
                      title: 'SIGN UP',
                      onPressed: () {
                        context.read<SignUpCubit>().signUp();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: () =>
                          context.read<SignUpCubit>().popBackToSignIn(),
                      child: const Text('Already have an account? Sign In'),
                    ),
                    const SizedBox(height: 50.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
