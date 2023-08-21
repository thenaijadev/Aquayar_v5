import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/config/validator/validator.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/core/widgets/snackbar.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/bloc/auth_bloc.dart';
import 'package:aquayar/features/auth/bloc/auth_event.dart';
import 'package:aquayar/features/auth/bloc/auth_state.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/input_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key, required this.token});
  final String token;

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: Image.asset(
            "assets/images/arrow_left_small.png",
            width: 24,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: TextWidget(
              text: "Create new password",
              color: AppColors.titleBlack,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 18, right: 30),
            child: TextWidget(
              text: "Your new password must be different from used passwords.",
              color: Color(0xFF868FAD),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 58.0),
                  child: InputFieldWidget(
                    obscureText: obscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.titleBlack,
                      ),
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
                      child: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.titleBlack,
                      ),
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
            padding: const EdgeInsets.only(bottom: 20.0, top: 42),
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
                                  authBloc.add(AuthEventChangePassword(
                                      token: widget.token,
                                      password:
                                          formfieldkey_1.currentState?.value,
                                      confirmPassword:
                                          formfieldkey_2.currentState?.value));
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
              },
            ),
          )
        ],
      ),
    );
  }
}
