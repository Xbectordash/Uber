import 'package:flutter/material.dart';
import 'package:uber_clone/features/landingpage/presentation/screens/landing_page.dart';
import 'package:uber_clone/features/homepage/presentation/screens/user_home.dart';
import 'package:uber_clone/features/homepage/presentation/screens/captain_home.dart';
import 'package:uber_clone/features/auth/presentation/screens/login_screen.dart';
import 'package:uber_clone/features/auth/presentation/screens/signup_screen.dart';
import 'package:uber_clone/features/auth/presentation/screens/update_user_screen.dart';
import 'package:uber_clone/features/auth/presentation/screens/captain_signup_screen.dart';

class ScreenViewerUtil extends StatelessWidget {
  ScreenViewerUtil({super.key});

  final List<_ScreenEntry> screens = const [
    _ScreenEntry('Landing Page', LandingPage()),
    _ScreenEntry('User Home Screen', UserHomeScreen()),
    _ScreenEntry('Captain Home Screen', CaptainHomeScreen()),
    _ScreenEntry('Login Screen', LoginScreen()),
    _ScreenEntry('Signup Screen', SignupScreen()),
    _ScreenEntry('Update User Screen', UpdateUserScreen()),
    _ScreenEntry('Captain Signup Screen', CaptainSignupScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen Viewer Util')),
      body: ListView.separated(
        itemCount: screens.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final entry = screens[index];
          return ListTile(
            title: Text(entry.name),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => entry.screen));
            },
          );
        },
      ),
    );
  }
}

class _ScreenEntry {
  final String name;
  final Widget screen;
  const _ScreenEntry(this.name, this.screen);
}
