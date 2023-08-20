import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/config/validator/validator.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/enums/gender.dart';
import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/core/widgets/snackbar.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/user/bloc/bloc/user_bloc.dart';

import 'package:aquayar/features/user/presentation/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({
    super.key,
  });

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final GlobalKey<FormFieldState> textFieldkey = GlobalKey<FormFieldState>();
  bool? nameHasError = false;
  final formKey = GlobalKey<FormState>();
  bool? genderSelected = false;
  String? choice;
  bool? genderChosen = false;
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.watch<UserBloc>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.titleBlack,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Center(
                child: TextWidget(
                  text: "What should we call you?",
                  color: AppColors.titleBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100.0, vertical: 30),
                  child: TextFormField(
                    validator: (val) {
                      final nameError = Validator.validateText(
                          textFieldkey.currentState?.value, "Username");
                      return nameError;
                    },
                    onChanged: (val) {
                      setState(() {
                        nameHasError = textFieldkey.currentState?.validate();
                      });
                    },
                    key: textFieldkey,
                    cursorColor: AppColors.inputBorder,
                    style: const TextStyle(
                      fontSize: 40,
                      color: AppColors.titleBlack,
                    ),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RadioBtn(
                        choice: choice,
                        label: Gender.Male.name,
                        onPressed: () {
                          setState(() {
                            choice = Gender.Male.name;
                            genderChosen = true;
                            showError = false;
                          });
                        }),
                    RadioBtn(
                        choice: choice,
                        label: Gender.Female.name.toString(),
                        onPressed: () {
                          setState(() {
                            choice = Gender.Female.name;
                            genderChosen = true;
                            showError = false;
                          });
                        }),
                    RadioBtn(
                        choice: choice,
                        label: "Choose not to say",
                        onPressed: () {
                          setState(() {
                            choice = "Choose not to say";
                            genderChosen = true;
                            showError = false;
                          });
                        })
                  ],
                ),
              ),
              Visibility(
                visible: showError,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/hazard.png"),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextWidget(
                          color: Color(0xffC0362C),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          text: "Let's know you better please? Select a gender",
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextWidget(
                    text: "Use a minimum of 3 characters with no spaces",
                    color: Color(0xff868FAE),
                    fontSize: 13,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserStateNameAndGenderUpdated) {
                      Navigator.pushNamed(
                        context,
                        Routes.profileDetails,
                      );
                    } else if (state is UserStateError) {
                      InfoSnackBar.showErrorSnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    return state is UserStateIsLoading
                        ? const LoadingWidget()
                        : nameHasError! && genderChosen!
                            ? GestureDetector(
                                onTap: () async {
                                  final formState =
                                      formKey.currentState?.validate();
                                  if (formState! && genderChosen!) {
                                    userBloc.add(UserEventUpdateGenderAndName(
                                      name: textFieldkey.currentState?.value,
                                      gender: choice!.toLowerCase(),
                                    ));
                                  } else if (!genderChosen!) {
                                    setState(() {
                                      showError = true;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12.0, left: 12.0, bottom: 30),
                                  child: Image.asset(
                                      "assets/images/continue_blue.png"),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, left: 16.0, bottom: 30),
                                child: Image.asset(
                                    "assets/images/continue_grey.png"),
                              );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
