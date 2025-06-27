import 'package:flutter/material.dart';
import 'package:uber_clone/features/auth/presentation/screens/login_screen.dart';
import 'package:uber_clone/features/auth/presentation/screens/signup_screen.dart';
import 'package:uber_clone/features/auth/presentation/screens/update_user_screen.dart';
import 'package:uber_clone/features/landingpage/presentation/screens/landing_page.dart';
import 'package:uber_clone/utils/screen_viewer_util.dart';

class AppStartScreen extends StatelessWidget {
  const AppStartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenViewerUtil();
  }
}
