import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otlob/core/res/app_sizes.dart';
import 'package:otlob/core/res/assets.dart';
import 'package:otlob/core/res/app_colors.dart';
import 'package:otlob/features/home/presentation/screens/home_screen.dart';
import 'package:otlob/features/sign_up/presentation/sign_up_screen.dart';
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

  bool _obscurePassword = true;
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSizes.padding,
            right: AppSizes.padding,
            top: 40,
            bottom: AppSizes.padding,
          ), //const EdgeInsets.fromLTRB(26, 40, 26, 24),
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
                  color: AppColors.muted,
                  height: 19.12 / 14,
                ),
              ),
              const SizedBox(height: 56),
              LabeledField(
                label: 'Email',
                hint: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              LabeledField(
                label: 'Password',
                hint: 'Please Enter Your Password',
                controller: _passwordController,
                obscureText: _obscurePassword,
                suffix: IconButton(
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  icon: SvgPicture.asset(
                    AppAssets.eyeFill,
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
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const HomeScreen()));
                },
              ),
              const SizedBox(height: 22),
              const OrDivider(),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      iconAsset: AppAssets.github,
                      label: 'GitHub',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: SocialButton(
                      iconAsset: AppAssets.gitlab,
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
              color: AppColors.ink,
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
              color: AppColors.danger,
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
            color: AppColors.muted,
            height: 19.12 / 14,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
          },
          child: Text(
            'Sign Up',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              height: 19.12 / 14,
            ),
          ),
        ),
      ],
    );
  }
}
