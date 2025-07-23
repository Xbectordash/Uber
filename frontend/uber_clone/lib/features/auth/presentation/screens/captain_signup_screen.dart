import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_state.dart';
import 'package:uber_clone/features/auth/presentation/widget/captain_signup/captain_signup_form.dart';
import 'package:uber_clone/features/auth/presentation/widget/captain_signup/captain_signup_message.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/l10n/app_localizations.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/utils/constans/text_style_const.dart';

class CaptainSignupScreen extends StatelessWidget {
  const CaptainSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CaptainAuthBloc(),
      child: BlocListener<CaptainAuthBloc, CaptainAuthState>(
        listener: (context, state) {
          if (state is CaptainAuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is CaptainCreated) {
            Navigator.of(context).pop(); 
            context.pushNamed(StringConstant.loginRouteName, extra: false);
          } else if (state is CaptainAuthError) {
            Navigator.of(context).pop(); 
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.createCaptainAccountString,
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
                onPressed: () => context.pop(), // GoRouter back
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: const [CaptainSignupMessage(), CaptainSignupForm()],
            ),
          ),
        ),
      ),
    );
  }
}
