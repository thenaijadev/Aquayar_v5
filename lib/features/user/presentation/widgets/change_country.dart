import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

void changeCountry(context, onSelect) {
  showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
        bottomSheetHeight: 500, // Optional. Country list modal height
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.inputBorder, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onSelect: onSelect);
}
