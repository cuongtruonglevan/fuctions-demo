import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bros_flutter/auth/auth_bloc/auth_cubit.dart';
import 'package:my_bros_flutter/app/routes/app_routes.dart';
import 'package:my_bros_flutter/app/routes/app_routes_factory.dart';
import 'package:my_bros_flutter/auth/auth_routes/auth_routes.dart';
import 'package:my_bros_flutter/auth/auth_routes/auth_routes_factory.dart';
import 'package:my_bros_flutter/data_access/data_access.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final _appTitle = 'Firebase Demo';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthCubit(authRepo: AuthAbstractRepository.createConcrete()),
      child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            Widget? _child;
            if (state is Authenticated) {
              _child = _buildMainApp(context, state.user);
            } else if (state is Unauthenticated) {
              _child = _buildAuthApp(context);
            } else {
              _child = _buildInitialApp(context);
            }
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
              child: AnimatedSwitcher(
                child: _child,
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                duration: const Duration(milliseconds: 250),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildAuthApp(BuildContext context) {
    final _routesFactory = AuthRoutesFactory();
    return MaterialApp(
      title: _appTitle,
      debugShowCheckedModeBanner: false,
      navigatorKey: _routesFactory.navigatorKey,
      initialRoute: AuthRoutes.signIn,
      onGenerateRoute: (settings) =>
          _routesFactory.generateRoutes(context, settings),
    );
  }

  Widget _buildMainApp(BuildContext context, User user) {
    final _routesFactory = AppRoutesFactory(user: user);
    return MaterialApp(
      title: _appTitle,
      debugShowCheckedModeBanner: false,
      navigatorKey: _routesFactory.navigatorKey,
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) =>
          _routesFactory.generateRoutes(context, settings),
    );
  }

  Widget _buildInitialApp(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[300],
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
