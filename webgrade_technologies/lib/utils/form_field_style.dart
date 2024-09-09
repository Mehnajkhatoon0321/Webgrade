// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:webgrade_technologies/utils/colours.dart';
import 'package:webgrade_technologies/utils/constant.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';




class FormFieldStyle {





  static InputDecoration defaultemailDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: Constants.emailHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: AppColors.FormFieldBackColour);










  static InputDecoration defaultPasswordInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: Constants.passwordHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
  );



  static InputDecoration defaultAddressInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: Constants.addressHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  );










  static InputDecoration dropDown=InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color:   AppColors.FormFieldBorderColour),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColour),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.FormFieldBorderColour),
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
    hintText: "Select Product Category",
    hintStyle:FTextStyle.formhintTxtStyle,
    errorStyle: TextStyle(color: Colors.red),
  );
}
