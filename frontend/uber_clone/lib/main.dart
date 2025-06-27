import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app.dart';
import 'package:uber_clone/cofing/routers/routers.dart';
import 'package:uber_clone/cofing/themes/app_theme.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_bloc.dart';
import 'package:uber_clone/utils/screen_viewer_util.dart';


void main() async {

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserAuthBloc()),
        BlocProvider(create: (context) => CaptainAuthBloc()),
        BlocProvider(create: (context) => UserFetchBloc()),
        BlocProvider(create: (context) => CaptainFetchBloc()),
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
    //   home: ScreenViewerUtil(),
    // );
  }
}
