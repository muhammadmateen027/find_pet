import 'package:find_pet/find_pet/find_pet.dart';
import 'package:flutter/material.dart';

import 'routes_name.dart';
import 'transition_animation/transition_animation.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings setting) {
    final args = setting.arguments;

    switch (setting.name) {
      case RoutesName.initial:
        return PageTransition.slideUpRoute(const DashboardPage());

      case RoutesName.petDetail:
        return PageTransition.slideUpRoute(PetDetail(imageUrl: args as String));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not available')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42),
            child: Text(
              'You requested page is not available at the moment.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    });
  }
}
