import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/cofing/routers/routers.dart';
import 'package:uber_clone/features/landingpage/presentation/screens/landing_page.dart';

class AppStartScreen extends StatefulWidget {
  const AppStartScreen({super.key});
  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Future<Map<String, String?>>? _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = _getStoredData();
  }

  Future<Map<String, String?>> _getStoredData() async {
    try {
      final token = await _storage.read(key: 'token');
      final isUser = await _storage.read(key: 'isUser');
      return {'token': token, 'isUser': isUser};
    } catch (e, stack) {
      debugPrint('Error reading from secure storage: $e\n$stack');
      return {'token': null, 'isUser': null};
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>> (
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final token = snapshot.data?['token'];
        final isUser = snapshot.data?['isUser'];
        debugPrint('Token: $token, IsUser: $isUser');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (token != null && isUser != null) {
            if (isUser == 'true') {
              GoRouter.of(context).goNamed('user-home');
            } else {
              GoRouter.of(context).goNamed('captain-home');
            }
          }
        });
        // Return an empty container while routing
        return LandingPage();
      },
    );
  }
}
