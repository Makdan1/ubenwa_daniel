import 'package:flutter/material.dart';
import 'package:ubenwa_daniel/ui/screens/home/home.dart';
import 'package:ubenwa_daniel/ui/screens/login/login_view.dart';
import 'package:ubenwa_daniel/ui/screens/register/register_view.dart';
import 'package:ubenwa_daniel/utils/router/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Login(),
      );
    case registerRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Register(),
      );

    case HomeRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: Home(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute(
    {required String routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
