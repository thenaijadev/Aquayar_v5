import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/config/validator/validator.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/core/widgets/snackbar.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/bloc/auth_bloc.dart';
import 'package:aquayar/features/auth/bloc/auth_state.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/input_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    super.key,
  });
  // final String token;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();

  bool? passwordState = false;
  bool? confirmPasswordState = false;

  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = context.watch<AuthBloc>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          centerTitle: true,
          title: const TextWidget(
            text: "Create new password",
            color: Color(0xFF20254F),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/images/arrow_left.png",
              width: 24,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 46.0),
                  child: InputFieldWidget(
                    obscureText: obscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: obscureText
                              ? Image.asset("assets/images/eye-slash.png")
                              : Image.asset("assets/images/eye.png")),
                    ),
                    textFieldkey: formfieldkey_1,
                    label: "Enter a password",
                    hintText: "•••••••••",
                    hintSize: 20,
                    onChanged: (val) {
                      setState(() {
                        passwordState = formfieldkey_1.currentState?.validate();
                      });
                    },
                    validator: (val) {
                      final passwordStatus = Validator.validatePassword(
                          formfieldkey_1.currentState?.value);
                      return passwordStatus;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: InputFieldWidget(
                    obscureText: obscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: obscureText
                              ? Image.asset("assets/images/eye-slash.png")
                              : Image.asset("assets/images/eye.png")),
                    ),
                    textFieldkey: formfieldkey_2,
                    label: "Confirm password",
                    hintText: "•••••••••",
                    hintSize: 20,
                    onChanged: (val) {
                      setState(() {
                        confirmPasswordState =
                            formfieldkey_2.currentState?.validate();
                      });
                    },
                    validator: (val) {
                      final confirmPasswordStatus =
                          Validator.validateConfirmPassword(
                              formfieldkey_2.currentState?.value,
                              formfieldkey_1.currentState?.value);
                      return confirmPasswordStatus;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 40),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateError) {
                  InfoSnackBar.showErrorSnackBar(context, state.message);
                }
                if (state is AuthStatePasswordChanged) {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.createNewPasswordSuccessful,
                      (route) => route.settings.name == Routes.login);
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : passwordState! && confirmPasswordState!
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GestureDetector(
                              onTap: () async {
                                final formIsValid =
                                    formKey.currentState?.validate();

                                if (formIsValid!) {
                                  // authBloc.add(AuthEventChangePassword(
                                  //     password:
                                  //         formfieldkey_1.currentState?.value,
                                  //     confirmPassword:
                                  //         formfieldkey_2.currentState?.value));
                                }
                              },
                              child: Image.asset(
                                  "assets/images/reset_password.png"),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child:
                                Image.asset("assets/images/continue_grey.png"),
                          );
                // if (state is AuthStateIsLoading) {
                //   return const Padding(
                //     padding: EdgeInsets.only(top: 20.0),
                //     child: LoadingWidget(
                //       color: Color.fromARGB(255, 4, 136, 231),
                //       size: 40.0,
                //     ),
                //   );
                // }
                // return BlueBtn(
                //     enabled: passwordState! && confirmPasswordState!,
                //     paddingVertical: 12,
                //     label: TextWidget(
                //       text: "  Send Instruction",
                //       color: passwordState! && confirmPasswordState!
                //           ? AppColors.white
                //           : AppColors.inputBorder,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 14,
                //     ),
                //     onPressed: () {

                //       }
                //     });
              },
            ),
          )
        ],
      ),
    );
  }
}
