import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/core/constants/app_colors.dart';
import 'package:social_media_app/core/widgets/rounded_button.dart';
import 'package:social_media_app/core/widgets/rounded_text_fields.dart';
import 'package:social_media_app/features/auth/Provider/auth_provider.dart';
import 'package:social_media_app/features/auth/presentation/screens/create_account_screen.dart';

import '../../util/utils.dart';

final _key = GlobalKey<FormState>();

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      setState(() {
        isLoading = true;
      });

      await ref.read(authProvider).signIn(
            email: _emailController.text,
            password: _passwordController.text,
          );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/icons/logo.png',
                width: 200,
              ),
              const Gap(40),
              Form(
                key: _key,
                child: Column(
                  children: [
                    RoundedTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.mail,
                      textInputAction: TextInputAction.next,
                      validator: validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Gap(20),
                    RoundedTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.password,
                      textInputAction: TextInputAction.done,
                      validator: validatePassword,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Gap(20),
                    RoundedButton(
                      label: 'Login',
                      onPressed: login,
                    ),
                    const Gap(20),
                    const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: AppColors.loginScreenColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Column(
                children: [
                  RoundedButton(
                    color: Colors.transparent,
                    label: 'Create new Account',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(CreateAccountScreen.routeName);
                    },
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
