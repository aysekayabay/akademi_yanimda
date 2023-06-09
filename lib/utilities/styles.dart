import 'package:flutter/material.dart';

class Styles {
  static const buttonDecoration = BoxDecoration(color: buttonColor, borderRadius: BorderRadius.all(Radius.circular(10)));
  static const buttonTextStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
  static const rankingTextStyle = TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  static BoxShadow normalShadow = BoxShadow(offset: Offset(0, -4), blurRadius: 5, spreadRadius: 0, color: Color(0xff2B44FF).withOpacity(0.2));
  static const forumGrey = Color(0xff7A757D);
  static const forumSubheaderStyle = TextStyle(color: forumGrey, fontSize: 14, fontWeight: FontWeight.w400);
  static const headerStyle = TextStyle(color: darkGrey, fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 25);
  static const rankHeaderStyle = TextStyle(color: Color(0xffF8F8F8), fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 24);
  static const forumSenderTitleStyle = TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 20);
  static const rankSubHeaderStyle = TextStyle(color: Color(0xffF8F8F8), fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 12);
  static const subHeaderStyle = TextStyle(color: Color(0xff98A3C7), fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 18);
  static const darkGrey = Color(0xff525F7F);
  static const lightGrey = Color(0xffA1B2CF);
  static const messageLightGrey = Color(0xffEEF2FF);
  static const messageDarkGrey = Color(0xff525F7F);
  static const messageTextStyle = TextStyle(color: Color(0xff525F7F), fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 12);
  static const rankGrey = Color(0xff6D6D6D);
  static const rankYellow = Color(0xffDAC400);
  static const rankOrange = Color(0xffDF7F25);

  static const baseOrange = Color(0xffFBF1E3);
  static const classicTextStyle = TextStyle(color: darkGrey, fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 18);
  static const buttonColor = Color(0xff686BFF);
  static const cardBlue = Color(0xff466CFF);
  static const cardPink = Color(0xffEE97BC);
  static const lightPink = Color(0xffDED7F1);
  static const rankingNum = TextStyle(fontFamily: "Montserrat", fontSize: 30, fontWeight: FontWeight.w800);

  static const darkPurp = Color(0xff5b37b7);
  static const hintStyle = TextStyle(fontFamily: 'Poppins', color: lightGrey, fontSize: 16, fontWeight: FontWeight.w900);
}
