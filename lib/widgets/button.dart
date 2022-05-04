import 'package:favorite/shared/size_config.dart';
import 'package:favorite/shared/theme.dart';
import 'package:flutter/material.dart';

ElevatedButton custom_button(
    BuildContext context, Size size, String label, bool isButtonEnabled, func) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: AppColors.primaryColor,
    ),
    onPressed: isButtonEnabled
        ? () {
            func();
          }
        : null,
    child: Container(
      // width: size.width * 0.35,
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      child: Text(
        "$label",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}

ElevatedButton button(
    BuildContext context, String label, bool isButtonEnabled, func) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(
          getProportionateScreenWidth(168), getProportionateScreenHeight(48)),
      maximumSize: Size(
          getProportionateScreenWidth(168), getProportionateScreenHeight(48)),
      primary: AppColors.primaryColor,
    ),
    onPressed: isButtonEnabled
        ? () {
            func();
          }
        : null,
    child: Container(
      // width: size.width * 0.35,

      child: Text(
        "$label",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}

ElevatedButton button_sport(
    BuildContext context, String label, bool isButtonEnabled, func) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(
          getProportionateScreenWidth(195), getProportionateScreenHeight(48)),
      maximumSize: Size(
          getProportionateScreenWidth(195), getProportionateScreenHeight(48)),
      primary: AppColors.primaryColor,
    ),
    onPressed: isButtonEnabled
        ? () {
            func();
          }
        : null,
    child: Container(
      // width: size.width * 0.35,

      child: Text(
        "$label",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}
