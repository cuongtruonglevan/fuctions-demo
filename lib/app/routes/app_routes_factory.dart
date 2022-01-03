import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bros_flutter/app/home/cubit/home_cubit.dart';
import 'package:my_bros_flutter/app/home/home_screen.dart';
import 'package:my_bros_flutter/app/routes/app_routes.dart';
import 'package:my_bros_flutter/data_access/data_access.dart';

class AppRoutesFactory {
  final User user;
  AppRoutesFactory({required this.user});

  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoutes(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, _, __) => BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
              appRepository: AppAbstractRepository.createConcrete(),
              navigatorKey: navigatorKey,
              overlayContext: navigatorKey.currentState!.overlay!.context,
            ),
            child: HomeScreen(user: user),
          ),
        );
      default:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, _, __) => const SizedBox(),
        );
    }
  }
}
