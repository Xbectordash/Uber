import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_state.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';

class CaptainHomeScreen extends StatelessWidget {
  const CaptainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Captain Home',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: ColorConst.onPrimary(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConst.primary(context),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
        ),
      ),
      body: BlocBuilder<CaptainFetchBloc, CaptainFetchState>(
        builder: (context, state) {
          if (state is CaptainFetchInitial) {
            context.read<CaptainFetchBloc>().add(GetCaptainEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is CaptainFetchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CaptainFetched) {
            final captain = state.captainData.captain;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Building"),)

                  ],
                ),
              ),
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
