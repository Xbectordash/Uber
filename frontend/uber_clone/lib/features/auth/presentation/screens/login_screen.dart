import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/auth/presentation/widget/login/login_message.dart';
import 'package:uber_clone/features/auth/presentation/widget/login/login_form.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/utils/constans/text_style_const.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final bool isUser = GoRouterState.of(context).extra as bool? ?? true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstant.loginString,
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
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LoginMessage(isUser: isUser),
              LoginForm(isUser: isUser),
            ],
          ),
        ),
      ),
    );
  }
}
