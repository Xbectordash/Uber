import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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

      if (token != null) {
        final expiry = JwtDecoder.getExpirationDate(token);
        debugPrint('Token expires at: $expiry');
      }

      return {'token': token, 'isUser': isUser};
    } catch (e, stack) {
      debugPrint('Error reading from secure storage: $e\n$stack');
      return {'token': null, 'isUser': null};
    }
  }

  bool isTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  Future<void> handleSessionExpired(BuildContext context) async {
    await _storage.deleteAll();
    if (mounted) {
      GoRouter.of(context).goNamed('landing-screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        final token = snapshot.data?['token'];
        final isUser = snapshot.data?['isUser'];

        debugPrint('Token: $token, IsUser: $isUser');

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          debugPrint('AppStartScreen: token=$token, isUser=$isUser');
          if (token == null || isUser == null || isTokenExpired(token)) {
            await handleSessionExpired(context);
          } else if (isUser == 'true') {
            GoRouter.of(context).goNamed('user-home');
          } else if (isUser == 'false') {
            GoRouter.of(context).goNamed('captain-home');
          } else {
            // Defensive: if isUser is not 'true' or 'false', treat as expired
            await handleSessionExpired(context);
          }
        });

        return Container(); // Empty widget while routing
      },
    );
  }
}
