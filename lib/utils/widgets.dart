//-------------------------------------------Form-------------------------------------------------------------------------
// EditText rounded Style
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'colors.dart';
import 'constants.dart';

Widget loading() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ]);
}

Padding editTextStyle(var hintText, TextEditingController myController,
    {isPassword = true}) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
        controller: myController,
        style:
        TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
        obscureText: isPassword,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.fromLTRB(10, 18, 24, 18),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey)
        ),
      ));
}

// Login/SignUp HeadingElement
Text formHeading(var label) {
  return Text(label,
      style:
      TextStyle(color: textColorPrimary, fontSize: 30, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

Text formSubHeadingForm(var label) {
  return Text(label,
      style: TextStyle(
          color: textColorSecondary, fontSize: 20, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

Widget text(var text,
    {var fontSize = textSizeLargeMedium,
      textColor = textColorSecondary,
      var fontFamily = fontRegular,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        letterSpacing: latterSpacing),
  );
}

Material shadowButton(var name, VoidCallback callbackFunction,Color colors) {
  return Material(
    elevation: 2,
    borderRadius: new BorderRadius.circular(10.0),
    child: SizedBox(
      width: double.infinity,
      height: 55,
      child: MaterialButton(
          child: text(name,
              fontSize: textSizeLargeMedium,
              textColor: white,
              fontFamily: fontMedium),
          textColor: white,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          color: colors,
          onPressed: callbackFunction),
    ),
  );
}
Widget squareShape( Color colors)
{
  return Container(color: colors);
}
Widget roundedSquare( Color colors)
{
  return Container(
      decoration:  BoxDecoration(
      color: colors,
      shape:BoxShape.rectangle ,
      borderRadius:BorderRadius.all(Radius.circular(8.0))
  ));
}
Widget circleShape( Color colors)
{
  return Container( decoration: BoxDecoration(
      color:colors,
      shape: BoxShape.circle
  ),);
}