import 'package:full_stack_ecommerce/common/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:full_stack_ecommerce/features/auth/screens/authscreen.dart';
import 'package:full_stack_ecommerce/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.authScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Page doesn't exist"),
          ),
        ),
      );
  }
}
