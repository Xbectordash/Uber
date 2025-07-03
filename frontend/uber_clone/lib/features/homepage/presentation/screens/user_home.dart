import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_state.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/features/homepage/presentation/widget/sliding_panel.dart';
import 'package:uber_clone/features/auth/domain/user_auth_repository.dart';
import 'package:uber_clone/sevrives/user_socket_servieces.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  bool _socketConnected = false;
  String? _lastConnectedUserId;

  @override
  void dispose() {
    // Optionally disconnect socket here
    // UserSocketService().disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Navigator.of(context).canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                color: ColorConst.primary(context),
                onPressed: () => Navigator.of(context).maybePop(),
              )
            : null,
        title: Text(
          StringConstant.appName,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: ColorConst.primary(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: ColorConst.primary(context)),
            onSelected: (value) async {
              if (value == 'logout') {
                // Disconnect socket on logout
                UserSocketService().disconnect();
                final userAuthRepo = UserAuthRepository();
                await userAuthRepo.logoutUser();
                context.goNamed(StringConstant.appStartRouteName);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Log Out'),
              ),
            ],
          ),
        ],
        automaticallyImplyLeading: true, // shows back button if possible
      ),
      body: BlocBuilder<UserFetchBloc, UserFetchState>(
        builder: (context, state) {
          if (state is UserFetchInitial) {
            context.read<UserFetchBloc>().add(GetUserEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserFetchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserFetched) {
            // Connect socket only once per user session
            if (!_socketConnected || _lastConnectedUserId != state.userData.sId) {
              UserSocketService().connect(state.userData.sId!);
              _socketConnected = true;
              _lastConnectedUserId = state.userData.sId;
            }
            debugPrint('User data fetched: \\${state.userData.sId}');
            return SlidingPanel();
          } else if (state is UserFetchError) {
            return Center(child: Text('Error: \\${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
