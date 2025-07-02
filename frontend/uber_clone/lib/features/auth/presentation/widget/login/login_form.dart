import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/auth/data/captain_model/login_captain_model.dart';
import 'package:uber_clone/features/auth/data/user_model/login_user_model.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_state.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_state.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/utils/global_validator.dart';

class LoginForm extends StatefulWidget {
  final bool isUser;
  const LoginForm({super.key, required this.isUser});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserAuthBloc, UserAuthState>(
          listener: (context, state) {
            if (state is UserLoggedIn) {
              context.pushNamed(StringConstant.userHomeRouteName);
            } else if (state is UserAuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
        BlocListener<CaptainAuthBloc, CaptainAuthState>(
          listener: (context, state) {
            if (state is CaptainLoggedIn) {
              context.pushNamed(StringConstant.captainHomeRouteName);
            } else if (state is CaptainAuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                obscureText: true,
                validator: GlobalValidator.validatePassword,
              ),
              const SizedBox(height: 24),
              SubmitButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    debugPrint(
                      'Email: ${emailController.text.trim()}, Password: ${passwordController.text.trim()}',
                    );

                    if (widget.isUser) {
                      debugPrint('User login initiated');
                      final bloc = BlocProvider.of<UserAuthBloc>(
                        context,
                        listen: false,
                      );
                      bloc.add(
                        LoginUserEvent(
                          loginUser: LoginUserRequest(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        ),
                      );
                    } else {
                      debugPrint('Captain login initiated');
                      final bloc = BlocProvider.of<CaptainAuthBloc>(
                        context,
                        listen: false,
                      );
                      bloc.add(
                        LoginCaptainEvent(
                          loginCaptain: CaptainLoginRequest(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        ),
                      );
                    }
                  }
                },
                text: StringConstant.loginString,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringConstant.dontHaveAccount,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () {
                      if (widget.isUser) {
                        context.pushNamed(StringConstant.signupRouteName);
                      } else {
                        context.pushNamed(StringConstant.captainSignupRouteName);
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      StringConstant.createAccountString,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _CustomTextField({
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.keyboardType,
    this.validator,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            obscureText: _obscure,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: '${StringConstant.enterYour} ${widget.labelText}',
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
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    )
                  : null,
            ),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 13),
            obscuringCharacter: _obscure ? '•' : '*',
            enableSuggestions: !_obscure,
            autocorrect: !_obscure,
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
    this.text = StringConstant.loginString,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
