import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app.dart';
import 'package:uber_clone/cofing/routers/routers.dart';
import 'package:uber_clone/cofing/themes/app_theme.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_bloc.dart';
import 'package:uber_clone/features/homepage/data/get_distance_time_model.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/create_ride_bloc/create_ride_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/driver_side_flow_cubit.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_fare/get_fare_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/suggestion/suggestion_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/widget/sliding_panel.dart';
import 'package:uber_clone/utils/screen_viewer_util.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/ride_flow_cubit.dart';


void main() async {

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserAuthBloc()),
        BlocProvider(create: (context) => CaptainAuthBloc()),
        BlocProvider(create: (context) => UserFetchBloc()),
        BlocProvider(create: (context) => CaptainFetchBloc(),),
        BlocProvider(create: (context)=> GetDistanceTimeBloc()),
        BlocProvider(create: (context)=> CreateRideBloc()),
        BlocProvider(create: (context)=>SuggestionBloc()),
        BlocProvider(create: (context) => GetFareBloc()),
        BlocProvider(create: (context) => RideFlowCubit()),
        BlocProvider(create: (context) => DriverSideFlowCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
      theme: AppTheme.theme,
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme.theme,
    //   home: SlidingPanel(),
    // );
  }
}
