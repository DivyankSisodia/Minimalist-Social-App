import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/core/constants/app_colors.dart';
import 'package:social_media_app/core/constants/constants.dart';
import 'package:social_media_app/core/utils/utils.dart';
import 'package:social_media_app/core/widgets/pick_image_widget.dart';
import 'package:social_media_app/core/widgets/rounded_button.dart';
import 'package:social_media_app/core/widgets/rounded_text_fields.dart';
import 'package:social_media_app/features/auth/Provider/auth_provider.dart';
import 'package:social_media_app/features/auth/presentation/widgets/birthday_picker.dart';
import 'package:social_media_app/features/auth/presentation/widgets/gender_picker.dart';
import 'package:social_media_app/features/auth/util/utils.dart';

final _key = GlobalKey<FormState>();

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  static const routeName = '/create-account';

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  File? image;

  DateTime? birthday;

  String gender = 'male';

  bool isLoading = false;

  late final TextEditingController _fNameController;
  late final TextEditingController _lNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> createAccount() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      setState(() => isLoading = true);
      await ref
          .read(authProvider)
          .createAccount(
            fullName: '${_fNameController.text} ${_lNameController.text}',
            birthDay: birthday ?? DateTime.now(),
            gender: gender,
            email: _emailController.text,
            password: _passwordController.text,
            image: image,
          )
          .then((credential) {
        // if email is verified then
        if (!credential!.user!.emailVerified) {
          Navigator.pop(context);
        }
      }).catchError((_) {
        setState(() => isLoading = false);
      });
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Form(
            key: _key,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () async {
                          image = await pickImage();
                          setState(() {});
                        },
                        child: Center(child: PickImageWidget(image: image)),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          RoundedTextField(
                            isPassword: false,
                            controller: _fNameController,
                            hintText: 'First Name',
                            prefixIcon: Icons.person,
                            textInputAction: TextInputAction.next,
                            validator: validateName,
                          ),
                          const Gap(15),
                          RoundedTextField(
                            isPassword: false,
                            controller: _lNameController,
                            hintText: 'Second Name',
                            prefixIcon: Icons.person,
                            textInputAction: TextInputAction.next,
                            validator: validateName,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Gap(30),
                BirthdayPickerWidget(
                  dateTime: birthday ?? DateTime.now(),
                  onPressed: () async {
                    birthday = await pickSimpleDate(
                      context: context,
                      date: birthday,
                    );
                    setState(() {});
                  },
                ),
                const Gap(30),
                GenderPicker(
                  gender: gender,
                  onChanged: (value) {
                    gender = value ?? 'male';
                    setState(() {});
                  },
                ),
                const Gap(20),
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
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RoundedButton(
                        label: 'Create Account',
                        onPressed: createAccount,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
