import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_state.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/driver_side_flow_cubit.dart';
import 'package:uber_clone/features/homepage/presentation/widget/sliding_panel.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/sevrives/captain_socket_servieces.dart';
import 'package:uber_clone/features/auth/domain/captain_auth_repository.dart';

class CaptainHomeScreen extends StatefulWidget {
  const CaptainHomeScreen({super.key});

  @override
  State<CaptainHomeScreen> createState() => _CaptainHomeScreenState();
}

class _CaptainHomeScreenState extends State<CaptainHomeScreen> {
  late final CaptainSocketService _socketService;
  bool _socketConnected = false;
  String? _lastConnectedCaptainId;
  Timer? _locationTimer;

  @override
  void initState() {
    super.initState();
    final driverCubit = context.read<DriverSideFlowCubit>();
    _socketService = CaptainSocketService(driverSideFlowCubit: driverCubit);
  }

  void _startCaptainLocationUpdates(String captainId) {
    _locationTimer?.cancel();
    _locationTimer = Timer.periodic(const Duration(minutes: 10), (_) {
      const double staticLat = 28.6139;
      const double staticLng = 77.2090;
      debugPrint('Captain Location: $staticLat, $staticLng');
      _socketService.updateLocation(captainId, staticLat, staticLng);
    });
  }

  @override
  void dispose() {
    _locationTimer?.cancel();
    _socketService.disconnect();
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
          'Captain Home',
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
                _socketService.disconnect();
                final captainAuthRepo = CaptainAuthRepository();
                await captainAuthRepo.logoutCaptain();
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
      ),
      body: BlocBuilder<CaptainFetchBloc, CaptainFetchState>(
        builder: (context, state) {
          if (state is CaptainFetchInitial) {
            context.read<CaptainFetchBloc>().add(GetCaptainEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is CaptainFetchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CaptainFetched) {
            final captain = state.captainData;
            final captainId = captain.captain?.sId;

            if (!_socketConnected || _lastConnectedCaptainId != captainId) {
              if (captainId != null) {
                _socketService.connect(captainId);
                _startCaptainLocationUpdates(captainId);
                _socketConnected = true;
                _lastConnectedCaptainId = captainId;
              }
            }

            return Column(
              children: [
                Expanded(
                  child: SlidingPanel(
                    captainData: captain,
                    isUser: false,
                  ),
                ),
              ],
            );
          } else if (state is CaptainFetchError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
