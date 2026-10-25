import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/res/gen/assets.gen.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/services/storage_services/storage_service.dart';
import 'package:otlob/core/ui_kit/overlay_loading/overlay_loading_manager.dart';
import 'package:otlob/core/utils/snackbar_helper.dart';
import 'package:otlob/core/validation/field_rules.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/features/sign_in/data/request/request.dart';
import 'package:otlob/features/sign_in/domain/usecase/sign_in_usecase.dart';
import 'package:otlob/features/sign_up/presentation/widgets/app_checkbox.dart';
import 'package:otlob/features/sign_up/presentation/widgets/labeled_field.dart';
import 'package:otlob/features/sign_up/presentation/widgets/or_divider.dart';
import 'package:otlob/features/sign_up/presentation/widgets/primary_button.dart';
import 'package:otlob/features/sign_up/presentation/widgets/social_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _obscurePassword = true;
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    sl<LoadingManager>().show();
    final error = await validateOnSubmit([
      // 1. Email
      SubmitField(
        value: _emailController.text,
        focusNode: _emailFocus,
        rule: Rules.all([
          Rules.required('Please enter your email'),
          Rules.email('Please enter a valid email address'),
        ]),
      ),

      // 2. Password
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

    final result = await sl<SignInUseCase>().execute(
      SignInRequest(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );

    sl<LoadingManager>().hide();

    await result.fold(
      (l) async => sl<SnackbarHelper>().showMessage(l.message, ErrorMessage.snackBar),
      (r) async {
        await sl<StorageService>().setMap("user_name", {
          "name" : r.displayName,
        });
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
          padding: EdgeInsets.only(
            left: SizeM.pagePadding,
            right: SizeM.pagePadding,
            top: 40,
            bottom: SizeM.pagePadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Wecome Back! 👋',
                style: GoogleFonts.manrope(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  height: 34.15 / 25,
                ),
              ),
              Text(
                'Hello again, you’ve been missed!',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorM.muted,
                  height: 19.12 / 14,
                ),
              ),
              const SizedBox(height: 56),
              LabeledField(
                label: 'Email',
                hint: 'Enter your email',
                controller: _emailController,
                focusNode: _emailFocus,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              LabeledField(
                label: 'Password',
                hint: 'Please Enter Your Password',
                controller: _passwordController,
                focusNode: _passwordFocus,
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
                label: 'Sign In',
                onPressed: _handleSignIn,
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
          'Don’t have an account ? ',
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: ColorM.muted,
            height: 19.12 / 14,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.signUp);
          },
          child: Text(
            'Sign Up',
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
