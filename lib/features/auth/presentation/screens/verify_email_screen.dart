// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/core/widgets/rounded_button.dart';
import 'package:social_media_app/features/auth/Provider/auth_provider.dart';
import 'package:social_media_app/features/auth/presentation/screens/create_account_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/home_screen.dart';

class VerifyEmailScreen extends ConsumerWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(authProvider).signOut();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              label: 'Verify Email',
              onPressed: () async {
                await ref.read(authProvider).verifyEmail().then((value) {
                  if (value == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email Verification sent to your email'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email not Verified'),
                      ),
                    );
                  }
                });
              },
            ),
            const Gap(15),
            RoundedButton(
              label: 'Change Password',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const CreateAccountScreen()));
              },
            ),
            const Gap(15),
            RoundedButton(
              label: 'Refresh',
              onPressed: () async {
                await FirebaseAuth.instance.currentUser!.reload();
                final emailVerified =
                    FirebaseAuth.instance.currentUser!.emailVerified;
                if (emailVerified == true) {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
