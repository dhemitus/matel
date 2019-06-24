import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Style {

//  static final Color blue = new Color(0xFF017AF5);
//  static final Color green = new Color(0xFF54CB4E);
  static final Color oldred = new Color(0xFFB91122);
  static final Color red = new Color(0xFFFFF0000);
  static final Color palered = new Color(0xFFFF4e53);
  static final Color lightred = new Color(0xFFFF7F81);
  static final Color mediumred = new Color(0xFFC81B1C);
  static final Color darkindigo = new Color(0xFF07133D);
  static final Color slategrey = new Color(0xFF5D6074);
  static final Color cloudyblue = new Color(0xFFC3C9E0);
  static final Color greylight = new Color(0xFFEFEFEF);
  static final Color verygreylight = new Color(0xFFF5F7F8);
  static final Color verybluelight = new Color(0xFFF6F9FE);


  static final Color white = Colors.white;
  static final Color black = Colors.black;
  static final Color transparent = Colors.transparent;

  static final double h7 = 12.5;

  static final FontWeight semibold = FontWeight.w600;
  static final FontWeight reguler = FontWeight.w400;
  static final FontWeight light = FontWeight.w300;

  static double fontSize;
  static double keySize;

  static final regularTextStyle = new TextStyle(
    fontFamily: 'Metropolis',
    color: Colors.white,
    fontWeight: reguler
  );

  static final lightTextStyle = new TextStyle(
    fontFamily: 'Metropolis',
    color: Colors.white,
    fontWeight: light
  );

  static final semiboldTextStyle = new TextStyle(
    fontFamily: 'Metropolis',
    color: Colors.white,
    fontWeight: semibold
  );

  static final h1 = lightTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(96) * fontSize,
    letterSpacing: -1.5
  );

  static final h2 = lightTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(60) * fontSize,
    letterSpacing: -0.5
  );

  static final h3 = regularTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(48) * fontSize,
    letterSpacing: 0.0
  );

  static final h4 = regularTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(34) * fontSize,
    letterSpacing: 0.25
  );

  static final h5 = regularTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(24) * fontSize,
    letterSpacing: 0.0
  );

  static final h6 = semiboldTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(20) * fontSize,
    letterSpacing: 0.15
  );

  static final subTitle1 = regularTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(16) * fontSize,
    letterSpacing: 0.15
  );

  static final subTitle2 = semiboldTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(14) * fontSize,
    letterSpacing: 0.1
  );

  static final body1 = regularTextStyle.copyWith(
      fontSize: ScreenUtil.getInstance().setSp(16) * fontSize,
      letterSpacing: 0.5
  );

  static final body2 = regularTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(14) * fontSize,
    letterSpacing: 0.25
  );

  static final button = semiboldTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(14) * fontSize,
    letterSpacing: 1.25
  );

  static final caption = regularTextStyle.copyWith(
      fontSize: ScreenUtil.getInstance().setSp(12) * fontSize,
      letterSpacing: 0.4
  );

  static final overline = regularTextStyle.copyWith(
      fontSize: ScreenUtil.getInstance().setSp(10) * fontSize,
      letterSpacing: 0.5
  );

  static final key = semiboldTextStyle.copyWith(
    fontSize: ScreenUtil.getInstance().setSp(20) * keySize,
    letterSpacing: 0.15
  );

  static const Offset top = Offset(0.0, -03.0);
  static const Offset bottom = Offset(0.0, 03.0);
}