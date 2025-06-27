import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_state.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/features/homepage/presentation/widget/sliding_panel.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

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
          IconButton(
            icon: const Icon(Icons.menu),
            color: ColorConst.primary(context),
            onPressed: () {
              // TODO: Implement multi-option drawer or menu in the future
            },
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
            final user = state.userData;
            return SlidingPanel();
          } else if (state is UserFetchError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
