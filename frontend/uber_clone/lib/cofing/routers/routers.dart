import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/app.dart';
import 'package:uber_clone/features/auth/presentation/screens/login_screen.dart';
import 'package:uber_clone/features/auth/presentation/screens/signup_screen.dart';
import 'package:uber_clone/features/auth/presentation/screens/update_user_screen.dart';
import 'package:uber_clone/features/homepage/presentation/screens/user_home.dart';
import 'package:uber_clone/features/homepage/presentation/screens/captain_home.dart';
import 'package:uber_clone/features/landingpage/presentation/screens/landing_page.dart';
import 'package:uber_clone/features/auth/presentation/screens/captain_signup_screen.dart';
import 'package:uber_clone/features/settings/presentation/screens/language_screen.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';

class AppRouters {
  // Private GoRouter instance
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: StringConstant.appStartRouteName,
        path: '/',
        builder: (context, state) => const AppStartScreen(),
      ),
      GoRoute(
        name: StringConstant.landingRouteName,
        path: '/landing-screen',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        name: StringConstant.userHomeRouteName,
        path: '/user-home',
        builder: (context, state) => const UserHomeScreen(),
      ),
      GoRoute(
        name: StringConstant.captainHomeRouteName,
        path: '/captain-home',
        builder: (context, state) => const CaptainHomeScreen(),
      ),
      GoRoute(
        name: StringConstant.loginRouteName,
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: StringConstant.signupRouteName,
        path: '/auth/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      // GoRoute(
      //   name: StringConstant.updateUserRouteName,
      //   path: '/auth/update',
      //   builder: (context, state) => const UpdateUserScreen(),
      // ),
      GoRoute(
        name: StringConstant.captainSignupRouteName,
        path: '/auth/captain/signup',
        builder: (context, state) => const CaptainSignupScreen(),
      ),
      GoRoute(
        name: StringConstant.languageRouteName,
        path: '/language',
        builder: (context, state) => const LanguageSelectionScreen(),
      ),
    ],
  );

  // Public getter
  static GoRouter get router => _router;
}
