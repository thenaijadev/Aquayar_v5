import 'package:aquayar/config/validator/validator.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/core/widgets/snackbar.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/bloc/auth_bloc.dart';
import 'package:aquayar/features/auth/bloc/auth_event.dart';
import 'package:aquayar/features/auth/bloc/auth_state.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/input_field_widget.dart';
import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/outlined_button_no_icon.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  bool? emailState = false;
  bool? passwordState = false;
  bool enabled = false;
  bool obscureText = true;
  bool? checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = context.watch<AuthBloc>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 20),
            child: TextWidget(
              text: "Happy to see you again 👋🏿",
              fontSize: 27,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
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
                final emailState =
                    Validator.validateEmail(formfieldkey_1.currentState?.value);
                return emailState;
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
                child: obscureText
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Image.asset("assets/images/eye-slash.png"),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Image.asset("assets/images/eye.png"),
                      ),
              ),
              textFieldkey: formfieldkey_2,
              label: "Choose a password",
              hintText: "•••••••••",
              hintSize: 20,
              onChanged: (val) {
                setState(() {
                  passwordState = formfieldkey_2.currentState?.validate();
                });
              },
              validator: (val) {
                final passwordStatus = Validator.validatePassword(
                    formfieldkey_2.currentState?.value);
                return passwordStatus;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPassword);
                  },
                  child: GradientText("Reset Password",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      colors: const [
                        Color(0xff61C7F9),
                        Color(0xff0579CE),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(10, 0),
                      child: Checkbox(
                          side: const BorderSide(width: 1, color: Colors.grey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          value: checkBoxValue,
                          onChanged: (val) {
                            setState(() {
                              checkBoxValue = val;
                            });
                          }),
                    ),
                    const TextWidget(
                      text: "Keep me logged in",
                      fontSize: 14,
                      color: Color(0xff868FAE),
                    )
                  ],
                )
              ],
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthStateLoggedIn) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.landing,
                  ((route) => route.settings.name == Routes.landing),
                );
              } else if (state is AuthStateError) {
                InfoSnackBar.showErrorSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return state is AuthStateIsLoading
                  ? const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: SpinKitSpinningLines(
                        color: Color.fromARGB(255, 4, 136, 231),
                        size: 40.0,
                      ),
                    )
                  : emailState! && passwordState!
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: GestureDetector(
                            onTap: () async {
                              final formState =
                                  formKey.currentState?.validate();

                              if (formState!) {
                                authBloc.add(AuthEventLogIn(
                                    email: formfieldkey_1.currentState?.value,
                                    password:
                                        formfieldkey_2.currentState?.value));
                              }
                            },
                            child:
                                Image.asset("assets/images/continue_blue.png"),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset("assets/images/continue_grey.png"),
                        );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/images/line.png",
                  width: 150,
                ),
              ),
              const TextWidget(
                text: "   or   ",
                color: AppColors.titleBlack,
              ),
              Flexible(
                child: Image.asset(
                  "assets/images/line.png",
                  width: 150,
                ),
              ),
            ],
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return state is GoogleAuthStateIsLoading
                  ? const LoadingWidget()
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 42),
                      child: GestureDetector(
                        onTap: () {
                          authBloc.add(const AuthEventSignInWithGoogle());
                        },
                        child: Image.asset("assets/images/google_login.png"),
                      ),
                    );
            },
          ),
          defaultTargetPlatform == TargetPlatform.iOS
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 20, bottom: 40),
                  child: GestureDetector(
                    onTap: () {
                      // authBloc.add(const AuthEventSignInWithGoogle());
                    },
                    child: Image.asset("assets/images/apple_login.png"),
                  ),
                )
              : const Text(""),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: TextWidget(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  text: "Dont have an account?",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              OutlinedButtonWidgetNoIcon(
                  width: 80,
                  height: 40,
                  label: "Sign up",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.registration);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
