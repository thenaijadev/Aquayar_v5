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
import 'package:aquayar/features/user/presentation/widgets/blue_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  bool? emailState = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = context.watch<AuthBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(212, 33, 37, 80),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: TextWidget(
              text: "Reset Password",
              color: AppColors.titleBlack,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, right: 30),
            child: TextWidget(
              text:
                  "Enter the email associated with your account and we’ll send an OTP code to the phone number associated with this email.",
              color: AppColors.darkTitleGrey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: InputFieldWidget(
                    textFieldkey: formfieldkey_1,
                    label: "Your email address",
                    hintText: "e.g:mark@gmail.com",
                    onChanged: (val) {
                      setState(() {
                        emailState = formfieldkey_1.currentState?.validate();
                      });
                    },
                    validator: (val) {
                      final emailState = Validator.validateEmail(
                          formfieldkey_1.currentState?.value);
                      return emailState;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child:
                BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is AuthStatePasswordResetRequestSent) {
                Navigator.pushReplacementNamed(context, Routes.emailSent,
                    arguments: formfieldkey_1.currentState?.value);
              } else if (state is AuthStateError) {
                InfoSnackBar.showErrorSnackBar(context, state.message);
              }
            }, builder: (context, state) {
              return state is AuthStateIsLoading
                  ? const Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: LoadingWidget())
                  : !emailState!
                      ? BlueBtn(
                          enabled: emailState!,
                          paddingVertical: 12,
                          label: TextWidget(
                            text: "  Send Instruction",
                            color: emailState!
                                ? AppColors.white
                                : AppColors.inputBorder,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          onPressed: () {})
                      : BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return state is AuthStateIsLoading
                                ? const LoadingWidget()
                                : GestureDetector(
                                    onTap: () {
                                      final formIsValid =
                                          formKey.currentState?.validate();
                                      if (formIsValid!) {
                                        bloc.add(AuthEventForgotPassword(
                                            email: formfieldkey_1
                                                .currentState?.value));
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 45),
                                      child: Image.asset(
                                          "assets/images/send_instruction_blue.png"),
                                    ));
                          },
                        );
            }),
          )
        ],
      ),
    );
  }
}
