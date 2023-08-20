import 'package:aquayar/config/logger/logger.dart';
import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/config/validator/validator.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/core/widgets/snackbar.dart';
import 'package:aquayar/features/auth/bloc/auth_bloc.dart';
import 'package:aquayar/features/auth/bloc/auth_event.dart';
import 'package:aquayar/features/auth/bloc/auth_state.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/input_field_widget.dart';
import 'package:aquayar/features/auth/presentation/widgets/registration_screen_widgets.dart/call_to_action.dart';
import 'package:aquayar/features/auth/presentation/widgets/registration_screen_widgets.dart/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterationForm extends ConsumerStatefulWidget {
  const RegisterationForm({super.key});

  @override
  ConsumerState<RegisterationForm> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends ConsumerState<RegisterationForm> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();

  bool? emailState = false;
  bool? passwordState = false;
  bool? confirmPasswordState = false;
  bool enabled = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            child: Image.asset("assets/images/logo.png"),
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
            padding: const EdgeInsets.only(top: 10.0),
            child: InputFieldWidget(
              obscureText: obscureText,
              padding: const EdgeInsets.symmetric(vertical: 8),
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
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              logger.e(state);
              if (state is AuthStateRegistered) {
                logger.e(state.getUser.toString());

                Navigator.pushNamed(context, Routes.gender,
                    arguments: state.getUser);
              } else if (state is AuthStateError) {
                InfoSnackBar.showErrorSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return state is AuthStateIsLoading
                  ? const LoadingWidget()
                  : emailState! && passwordState!
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: GestureDetector(
                            onTap: () async {
                              final formState =
                                  formKey.currentState?.validate();

                              if (formState!) {
                                authBloc.add(AuthEventRegister(
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
          const CallToAction(),
          const TermsAndConditions()
        ],
      ),
    );
  }
}
