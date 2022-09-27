import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/scrn/Dashboard.dart';
import 'package:intrale/scrn/LoginOrSignup/ChangePassword.dart';
import 'package:intrale/scrn/LoginOrSignup/ChoseLoginOrSignup.dart';
import 'package:intrale/scrn/LoginOrSignup/Confirm.dart';
import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/scrn/LoginOrSignup/Recovery.dart';
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
    ),
    GoRoute(
      path: '/recovery',
      builder: (BuildContext context, GoRouterState state) {
        return Recovery();
      },
    ),
    GoRoute(
      path: '/confirm',
      builder: (BuildContext context, GoRouterState state) {
        return Confirm();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return Dashboard();
      },
    ),
    GoRoute(
      path: '/changePassword',
      builder: (BuildContext context, GoRouterState state) {
        Map<String, String>? params = state.extra as Map<String, String>?;
        debugPrint('forward to changePassword:' + params.toString());
        String email = params!['email']!;
        String password = params!['password']!;
        debugPrint('email:' + email);
        debugPrint('password:' + password);
        return ChangePassword(email: email, password: password);
      }, 
      
    )
  ]

  );
  
}