import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/scrn/LoginOrSignup/ChoseLoginOrSignup.dart';
import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/scrn/LoginOrSignup/Signup.dart';
import 'package:intrale/SplashScreen.dart';

class IntraleRouter extends GoRouter{
  IntraleRouter():super(
    routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return Login();
      },
    ),
    GoRoute(
      path: '/choseLogin',
      builder: (BuildContext context, GoRouterState state) {
        return ChoseLogin();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return Signup();
      },
    )
  ]

  );
  
}