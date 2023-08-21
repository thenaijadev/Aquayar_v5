import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/core/widgets/snackbar.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/input_field_widget.dart';
import 'package:aquayar/features/user/bloc/bloc/user_bloc.dart';
import 'package:aquayar/features/user/presentation/widgets/change_country.dart';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key, required this.data});

  final List data;

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey = GlobalKey<FormFieldState>();

  bool? emailState = false;
  bool enabled = false;
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  bool? phoneNumberHasError = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userbloc = context.watch<UserBloc>();
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextWidget(
                  text: "Phone Verification, ",
                  color: AppColors.titleBlack,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: TextWidget(
                  text:
                      "We need to do this be make sure we can reach you through this number. Make sure it's correct.",
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
                        initialValue:
                            formatPhoneNumber(widget.data[0], widget.data[1]),
                        suffixIcon:
                            Image.asset("assets/images/check_circle.png"),
                        prefixicon: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    changeCountry(context, (Country country) {
                                      setState(() {
                                        countryFlag = country.flagEmoji;
                                      });
                                    });
                                  },
                                  child: TextWidget(
                                    text: countryFlag!,
                                    fontSize: 20,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset("assets/images/line_vert.png"),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        obscureText: obscureText,
                        textFieldkey: formfieldkey,
                        label: "Phone number",
                        hintText: "",
                        hintSize: 20,
                        onChanged: (val) {
                          setState(() {
                            phoneNumberHasError =
                                formfieldkey.currentState?.validate();
                          });
                        },
                        validator: (val) {
                          if (formfieldkey.currentState?.value.length != 17) {
                            return "Please enter a valid phone number";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserStateOtpRequestSent) {
                  Navigator.popAndPushNamed(context, Routes.otp,
                      arguments: widget.data);
                } else if (state is UserStateError) {
                  InfoSnackBar.showErrorSnackBar(context, state.error);
                }
              },
              builder: (context, state) {
                return state is UserStateIsLoading
                    ? const LoadingWidget()
                    : phoneNumberHasError!
                        ? GestureDetector(
                            onTap: () {
                              final formIsValid =
                                  formKey.currentState?.validate();
                              if (formIsValid!) {
                                final formIsValid =
                                    formKey.currentState?.validate();
                                if (formIsValid!) {
                                  String number = formatPhoneNumber(
                                      widget.data[0], widget.data[1]);
                                  String newNumber = number.replaceAll("-", "");

                                  userbloc.add(UserEventGetOtp(
                                    phone: newNumber,
                                  ));
                                }
                              }
                            },
                            child: Image.asset("assets/images/verify_blue.png"))
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

String formatPhoneNumber(String number, String countryCode) {
  return "+$countryCode-${number.substring(1, 4)}-${number.substring(4, 7)}-${number.substring(7, number.length)}";
}
