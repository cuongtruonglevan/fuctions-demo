import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bros_flutter/auth/sign_in/bloc/sign_in_cubit.dart';
import 'package:my_bros_flutter/shared/app_widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.blueGrey[300],
          body: Form(
            key: state.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(height: 100.0),
                    AppLoadingButton(
                      showLoading: true,
                      disabled: state.loading,
                      title: 'SIGN IN WITH EMAIL',
                      onPressed: () {
                        context.read<SignInCubit>().signIn();
                      },
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
