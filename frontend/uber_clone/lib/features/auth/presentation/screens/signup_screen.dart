import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_state.dart';
import 'package:uber_clone/features/auth/presentation/widget/signup/signup_form.dart';
import 'package:uber_clone/features/auth/presentation/widget/signup/signup_message.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/l10n/app_localizations.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/utils/constans/text_style_const.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserAuthBloc(),
      child: BlocListener<UserAuthBloc, UserAuthState>(
        listener: (context, state) {
          if (state is UserAuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is UserCreated) {
            Navigator.of(context).pop(); // Close loader
            context.pushNamed(StringConstant.loginRouteName, extra: true); // GoRouter
          } else if (state is UserAuthError) {
            Navigator.of(context).pop(); // Close loader
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.createAccountString,
              style: TextStyleConst.bodyLarge(context),
            ),
            centerTitle: true,
            backgroundColor: ColorConst.primary(context),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.close, color: ColorConst.onPrimary(context)),
                onPressed: () => context.pop(), // Using GoRouter to pop
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SignupMessage(),
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
