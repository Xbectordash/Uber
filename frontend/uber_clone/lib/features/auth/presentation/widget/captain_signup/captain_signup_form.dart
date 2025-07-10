import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_event.dart';
import 'package:uber_clone/features/auth/data/captain_model/signup_captain_model.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/utils/global_validator.dart';
import 'package:uber_clone/l10n/app_localizations.dart';

class CaptainSignupForm extends StatefulWidget {
  const CaptainSignupForm({super.key});

  @override
  State<CaptainSignupForm> createState() => _CaptainSignupFormState();
}

class _CaptainSignupFormState extends State<CaptainSignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController vehicleColorController = TextEditingController();
  final TextEditingController vehiclePlateController = TextEditingController();
  final TextEditingController vehicleCapacityController =
      TextEditingController();
  final TextEditingController vehicleTypeController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
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
                  labelText: localizations!.firstName,
                  obscureText: false,
                  validator: (value) => GlobalValidator.validateFirstName(value,localizations),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _CustomTextField(
                  controller: lastNameController,
                  labelText: localizations!.lastName,
                  obscureText: false,
                  validator: (value) => GlobalValidator.validateLastName(value,localizations),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _CustomTextField(
            controller: emailController,
            labelText: localizations!.emailString,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => GlobalValidator.validateEmail(value,localizations),
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
            validator: (value) => GlobalValidator.validatePassword(value,localizations),
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
              localizations,
            ),
          ),
          const SizedBox(height: 16),
          _CustomTextField(
            controller: vehicleColorController,
            labelText: StringConstant.vehicleColor,
            obscureText: false,
            validator: (value) => GlobalValidator.validateVehicleColor(value,localizations),
          ),
          const SizedBox(height: 8),
          _CustomTextField(
            controller: vehiclePlateController,
            labelText: StringConstant.vehiclePlate,
            obscureText: false,
            validator: (value) => GlobalValidator.validateVehiclePlate(value,localizations),
          ),
          const SizedBox(height: 8),
          _CustomTextField(
            controller: vehicleCapacityController,
            labelText: StringConstant.vehicleCapacity,
            obscureText: false,
            keyboardType: TextInputType.number,
            validator: (value) => GlobalValidator.validateVehicleCapacity(value,localizations),
          ),
          const SizedBox(height: 8),
          _CustomTextField(
            controller: vehicleTypeController,
            labelText: StringConstant.vehicleType,
            obscureText: false,
            validator: (value) => GlobalValidator.validateVehicleType(value,localizations),
          ),
          const SizedBox(height: 24),
          SubmitButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final bloc = BlocProvider.of<CaptainAuthBloc>(
                  context,
                  listen: false,
                );
                bloc.add(
                  CreateCaptainEvent(
                    createCaptain: CaptainRegisterRequest(
                      fullname: Fullname(
                        firstname: firstNameController.text.trim(),
                        lastname: lastNameController.text.trim(),
                      ),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      vehicle: Vehicle(
                        color: vehicleColorController.text.trim(),
                        plate: vehiclePlateController.text.trim(),
                        capacity: int.tryParse(
                          vehicleCapacityController.text.trim(),
                        ),
                        vehicleType: vehicleTypeController.text.trim(),
                      ),
                    ),
                  ),
                );
              }
            },
            text: StringConstant.createAccountString,
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