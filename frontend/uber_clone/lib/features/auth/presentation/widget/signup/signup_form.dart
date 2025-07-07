import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_event.dart';
import 'package:uber_clone/features/auth/data/user_model/signup_user_model.dart';
import 'package:uber_clone/utils/global_validator.dart';

class SignupForm extends StatefulWidget {
  SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: _CustomTextField(
                  controller: firstNameController,
                  labelText: StringConstant.firstName,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return StringConstant.firstNameRequired;
                    }
                    if (value.trim().length < 2) {
                      return StringConstant.firstNameMin;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _CustomTextField(
                  controller: lastNameController,
                  labelText: StringConstant.lastName,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return StringConstant.lastNameRequired;
                    }
                    if (value.trim().length < 2) {
                      return StringConstant.lastNameMin;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _CustomTextField(
            controller: emailController,
            labelText: StringConstant.emailString,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            validator: GlobalValidator.validateEmail,
          ),
          const SizedBox(height: 16),
          _CustomTextField(
            controller: passwordController,
            labelText: StringConstant.passwordString,
            obscureText: _obscurePassword,
            isPassword: true,
            onToggleObscure: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
            validator: GlobalValidator.validatePassword,
          ),
          const SizedBox(height: 16),
          _CustomTextField(
            controller: confirmPasswordController,
            labelText: StringConstant.confirmPasswordString,
            obscureText: _obscureConfirmPassword,
            isPassword: true,
            onToggleObscure: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
            validator: (value) => GlobalValidator.validateConfirmPassword(
              passwordController.text,
              value,
            ),
          ),
          const SizedBox(height: 24),
          SubmitButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final bloc = BlocProvider.of<UserAuthBloc>(
                  context,
                  listen: false,
                );
                bloc.add(
                  CreateUserEvent(
                    createUser: RegisterUserRequest(
                      firstname: firstNameController.text.trim(),
                      lastname: lastNameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final VoidCallback? onToggleObscure;

  const _CustomTextField({
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.keyboardType,
    this.validator,
    this.isPassword = false,
    this.onToggleObscure,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            decoration: InputDecoration(
              hintText: '${StringConstant.enterYour} $labelText',
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onPressed: onToggleObscure,
                    )
                  : null,
            ),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 13),
            obscuringCharacter: obscureText ? '•' : '*',
            enableSuggestions: !obscureText,
            autocorrect: !obscureText,
            enableInteractiveSelection: true,
          ),
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SubmitButton({
    super.key,
    required this.onPressed,
    this.text = StringConstant.createAccountString,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConst.tertiary(context),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorConst.onPrimary(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
