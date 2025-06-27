import 'package:flutter/material.dart';
import 'package:uber_clone/features/auth/presentation/widget/captain_signup/captain_signup_form.dart';
import 'package:uber_clone/features/auth/presentation/widget/captain_signup/captain_signup_message.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/utils/constans/text_style_const.dart';

class CaptainSignupScreen extends StatefulWidget {
  const CaptainSignupScreen({super.key});

  @override
  State<CaptainSignupScreen> createState() => _CaptainSignupScreenState();
}

class _CaptainSignupScreenState extends State<CaptainSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstant.createCaptainAccountString,
          style: TextStyleConst.bodyLarge(context),
        ),
        centerTitle: true,
        backgroundColor: ColorConst.primary(context),
        elevation: 0,
        shape: RoundedRectangleBorder(
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
      body: SingleChildScrollView(
        child: Column(children: [CaptainSignupMessage(), CaptainSignupForm()]),
      ),
    );
  }
}
// CaptainSignupMessage