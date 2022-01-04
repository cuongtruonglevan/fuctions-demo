import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bros_flutter/auth/auth_bloc/auth_cubit.dart';
import 'package:my_bros_flutter/auth/auth_routes/auth_routes.dart';
import 'package:my_bros_flutter/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:my_bros_flutter/auth/sign_in/sign_in_screen.dart';
import 'package:my_bros_flutter/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:my_bros_flutter/auth/sign_up/sign_up_screen.dart';
import 'package:my_bros_flutter/auth/welcome/welcome_screen.dart';
import 'package:my_bros_flutter/data_access/data_access.dart';

class AuthRoutesFactory {
  AuthRoutesFactory();

// CUONG.TRUONG on January/03/2022: used to push/pop in Cubit
  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoutes(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case AuthRoutes.welcome:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, _, __) => _buildWelcomeScreen(),
        );
      case AuthRoutes.signIn:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, _, __) => _buildSignInScreen(),
        );
      case AuthRoutes.signUp:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, _, __) => _buildSignUpScreen(),
        );
      default:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, _, __) => const SizedBox(),
        );
    }
  }

  _buildWelcomeScreen() => const WelcomeScreen();
  _buildSignInScreen() => BlocProvider<SignInCubit>(
        create: (context) => SignInCubit(
          navigatorKey: navigatorKey,
          authRepo: AuthAbstractRepository.createConcrete(),
          authCubit: BlocProvider.of<AuthCubit>(context),
        ),
        child: const SignInScreen(),
      );
  _buildSignUpScreen() => BlocProvider(
        create: (context) => SignUpCubit(
          navigatorKey: navigatorKey,
          authRepo: AuthAbstractRepository.createConcrete(),
          authCubit: BlocProvider.of<AuthCubit>(context),
        ),
        child: const SignUpScreen(),
      );
}
