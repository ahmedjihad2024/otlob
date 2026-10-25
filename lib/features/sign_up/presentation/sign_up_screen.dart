import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/res/gen/assets.gen.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/services/storage_services/storage_service.dart';
import 'package:otlob/core/ui_kit/overlay_loading/overlay_loading_manager.dart';
import 'package:otlob/core/utils/snackbar_helper.dart';
import 'package:otlob/core/validation/field_rules.dart';
import 'package:otlob/features/sign_up/data/request/request.dart';
import 'package:otlob/features/sign_up/domain/usecase/sign_up_usecase.dart';

import 'widgets/app_checkbox.dart';
import 'widgets/labeled_field.dart';
import 'widgets/or_divider.dart';
import 'widgets/primary_button.dart';
import 'widgets/social_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _obscurePassword = true;
  bool _rememberMe = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();

    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    sl<LoadingManager>().show();
    final error = await validateOnSubmit([
      // 1. Name
      SubmitField(
        value: _nameController.text,
        focusNode: _nameFocus,
        rule: Rules.all([
          Rules.required('Please enter your name'),
          Rules.minLength(3, 'Name must be at least 3 characters'),
        ]),
      ),

      // 2. Email
      SubmitField(
        value: _emailController.text,
        focusNode: _emailFocus,
        rule: Rules.all([
          Rules.required('Please enter your email'),
          Rules.email('Please enter a valid email address'),
        ]),
      ),

      // 3. Phone (Same as email and name!)
      SubmitField(
        value: _phoneController.text,
        focusNode: _phoneFocus,
        rule: Rules.phone(
          dialCode: '+20',
          requiredMessage: 'Please enter your phone number',
          invalidMessage: 'Invalid phone number format',
        ),
      ),

      // 4. Password
      SubmitField(
        value: _passwordController.text,
        focusNode: _passwordFocus,
        rule: Rules.all([
          Rules.required('Please enter your password'),
          Rules.minLength(6, 'Password must be at least 6 characters'),
        ]),
      ),
    ]);

    if (error != null) {
      sl<LoadingManager>().hide();
      sl<SnackbarHelper>().showMessage(error, ErrorMessage.snackBar);
      return;
    }

    final result = await sl<SignUpUseCase>().execute(
      SignUpRequest(
        displayName: _nameController.text,
        email: _emailController.text,
        phoneNumber: _phoneController.text,
        password: _passwordController.text,
      ),
    );

    sl<LoadingManager>().hide();

    await result.fold(
      (l) async =>
          sl<SnackbarHelper>().showMessage(l.message, ErrorMessage.snackBar),
      (r) async {
        await sl<StorageService>().setMap("user_name", {"name": r.displayName});
        await sl<StorageService>().setToken(r.token);
        if (mounted) {
          context.goNamed(Routes.home);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(26, 40, 26, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: GoogleFonts.manrope(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  height: 34.15 / 25,
                ),
              ),
              Text(
                'Connect with your friends today!',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorM.muted,
                  height: 19.12 / 14,
                ),
              ),
              const SizedBox(height: 56),
              LabeledField(
                label: 'Name',
                hint: 'Enter your name',
                controller: _nameController,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 15),
              LabeledField(
                label: 'Email Address',
                hint: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              LabeledField(
                label: 'Phone Number',
                hint: 'Enter your phone',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),
              LabeledField(
                label: 'Password',
                hint: 'Please Enter Your Password',
                controller: _passwordController,
                obscureText: _obscurePassword,
                suffix: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  icon: SvgPicture.asset(
                    Assets.svg.eyeFill.path,
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
              const SizedBox(height: 31),
              _RememberForgotRow(
                rememberMe: _rememberMe,
                onRememberChanged: (value) {
                  setState(() => _rememberMe = value);
                },
                onForgotPassword: () {},
              ),
              const SizedBox(height: 31),
              PrimaryButton(
                label: 'Sign Up',
                onPressed: () {
                  _handleSignUp();
                },
              ),
              const SizedBox(height: 22),
              const OrDivider(),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      iconAsset: Assets.svg.github.path,
                      label: 'GitHub',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: SocialButton(
                      iconAsset: Assets.svg.gitlab.path,
                      label: 'GitLab',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              const _LoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RememberForgotRow extends StatelessWidget {
  const _RememberForgotRow({
    required this.rememberMe,
    required this.onRememberChanged,
    required this.onForgotPassword,
  });

  final bool rememberMe;
  final ValueChanged<bool> onRememberChanged;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCheckbox(value: rememberMe, onChanged: onRememberChanged),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () => onRememberChanged(!rememberMe),
          child: Text(
            'Remember Me',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorM.ink,
              height: 19.12 / 14,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onForgotPassword,
          child: Text(
            'Forgot Password',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorM.danger,
              height: 19.12 / 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginPrompt extends StatelessWidget {
  const _LoginPrompt();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ? ',
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: ColorM.muted,
            height: 19.12 / 14,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            'Login',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorM.primary,
              height: 19.12 / 14,
            ),
          ),
        ),
      ],
    );
  }
}
