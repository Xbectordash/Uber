import 'package:flutter/material.dart';
import 'package:uber_clone/features/auth/presentation/widget/signup/signup_form.dart';
import 'package:uber_clone/features/auth/presentation/widget/signup/signup_message.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/utils/constans/text_style_const.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          StringConstant.createAccountString,
          style: TextStyleConst.bodyLarge(context),
        ),

        centerTitle: true,
        backgroundColor: ColorConst.primary(context),
        // foregroundColor: ColorConst.onPrimary(context),
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
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SignupMessage(),
            SignupForm(),
        
           
          ]
        ),
      ),
    );
  }
}
