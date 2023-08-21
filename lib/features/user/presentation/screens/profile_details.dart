import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/config/validator/validator.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/constants/nigerian_states.dart';
import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/core/widgets/snackbar.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/input_field_widget.dart';
import 'package:aquayar/features/user/bloc/bloc/user_bloc.dart';
import 'package:aquayar/features/user/presentation/widgets/change_country.dart';
import 'package:aquayar/features/user/presentation/widgets/tank_size_radio_buttons.dart';
import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';

import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({
    super.key,
  });

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();

  String city = "";
  late TextEditingController cityController;
  bool? emailState = false;
  bool? addressState = false;
  bool enabled = false;
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  bool? phoneNumberHasError = false;
  String? choice;
  String countryCode = "234";
  late String? name;
  @override
  void initState() {
    cityController = TextEditingController();
    final AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;
    name = user.displayName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.watch<UserBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Image.asset("assets/images/arrow_left_small.png"),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextWidget(
                  text: "Hey, ",
                  color: AppColors.titleBlack,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextWidget(
                  text: "Hey, $name👑",
                  color: AppColors.titleBlack,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 18),
                child: TextWidget(
                  text: "Kindly complete your profile details to proceed.",
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
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: InputFieldWidget(
                        obscureText: obscureText,
                        textFieldkey: formfieldkey_1,
                        label: "Your address",
                        hintText: "",
                        hintSize: 20,
                        labelFontSize: 16,
                        onChanged: (val) {
                          setState(() {
                            addressState =
                                formfieldkey_1.currentState?.validate();
                          });
                        },
                        validator: (val) {
                          final addressError = Validator.validateAddress(
                              formfieldkey_1.currentState?.value, "This field");
                          return addressError;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: TextWidget(
                              text: "Your current city",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SearchField(
                            onSubmit: (value) {},
                            controller: cityController,
                            suggestions: nigerianStates
                                .map((e) => SearchFieldListItem(e))
                                .toList(),
                            suggestionState: Suggestion.expand,
                            textInputAction: TextInputAction.next,
                            hint: 'Select',
                            searchStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            validator: (x) {
                              if (!nigerianStates.contains(x) || x!.isEmpty) {
                                return 'Please Enter a valid city';
                              }
                              return null;
                            },
                            searchInputDecoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  width: 2.0,
                                ),
                              ),
                              suffixIcon: const Icon(
                                Icons.expand_more,
                                color: Color.fromARGB(183, 33, 37, 80),
                              ),
                              hintStyle: const TextStyle(
                                color: AppColors.hintColor,
                                fontSize: 15,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inputBorder, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inputBorder, width: 1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onSuggestionTap: (value) {
                              city = value.searchKey;
                            },
                            maxSuggestionsInViewPort: 6,
                            itemHeight: 50,
                            suggestionsDecoration: SuggestionDecoration(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InputFieldWidget(
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
                                        countryCode = country.phoneCode;
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
                        textFieldkey: formfieldkey_3,
                        label: "Phone number",
                        hintText: "",
                        hintSize: 20,
                        onChanged: (val) {
                          setState(() {
                            phoneNumberHasError =
                                formfieldkey_3.currentState?.validate();

                            formKey.currentState?.validate();
                          });
                        },
                        validator: (val) {
                          final passwordStatus = Validator.validatePhoneNumber(
                            formfieldkey_3.currentState?.value,
                          );
                          return passwordStatus;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 16),
                child: TextWidget(
                  text: "Choose your water tank size",
                  color: AppColors.titleBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TankSizeRadioBtn(
                            label: tankSizes[index],
                            onPressed: () {
                              setState(() {
                                choice = tankSizes[index];
                              });
                            },
                            choice: choice),
                      );
                    },
                    itemCount: tankSizes.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 17,
                      color: Color(0xff868FAE),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: "This is optional, and can be changed.",
                      color: Color(0xff868FAE),
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserStateLocationUpdated) {
                      Navigator.pushNamed(context, Routes.phoneVerification,
                          arguments: [
                            formfieldkey_3.currentState?.value,
                            countryCode
                          ]);
                    } else if (state is UserStateError) {
                      InfoSnackBar.showErrorSnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is UserStateIsLoading) {
                      return const LoadingWidget();
                    } else {
                      return addressState! &&
                              city.isNotEmpty &&
                              phoneNumberHasError!
                          ? GestureDetector(
                              onTap: () {
                                final formIsValid =
                                    formKey.currentState?.validate();
                                if (formIsValid!) {
                                  userBloc.add(UserEventUpdateCustomerLocation(
                                    countryCode: countryCode,
                                    city: city,
                                    phone: formfieldkey_3.currentState?.value,
                                    address: formfieldkey_1.currentState?.value,
                                    tankSize: double.parse(choice!).toDouble(),
                                  ));
                                }
                              },
                              child: Image.asset(
                                  "assets/images/continue_blue.png"))
                          : Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset(
                                  "assets/images/continue_grey.png"),
                            );
                    }
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
