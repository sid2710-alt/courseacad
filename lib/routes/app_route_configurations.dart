import 'package:courseacademy/pages/register/register.dart';
import 'package:courseacademy/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/welcome/welcome.dart';

class MyAppRouteConfigurations{
GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Welcome());
      },
      routes: <RouteBase> [
        GoRoute(
            name: 'signIn',
            path: 'signIn',
            builder: (context, state) => const SignIn()
        ),
        GoRoute(
            name: 'register',
            path: 'register',
            builder: (context, state) => const Register()

        ),
      ]
    ),

  ]

);
}