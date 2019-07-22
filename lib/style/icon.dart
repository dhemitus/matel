import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mata_elang/style/style.dart';

class STIcon {
  static final Widget ads = new SvgPicture.asset('assets/svgs/ads.svg', semanticsLabel: 'ads',);
  static final Widget logo = new SvgPicture.asset('assets/svgs/eagle.svg', semanticsLabel: 'logo',);
  static final Widget arrowDown = new SvgPicture.asset('assets/svgs/arrow-down.svg', semanticsLabel: 'arrow down',);
  static final Widget arrowLeft = new SvgPicture.asset('assets/svgs/arrow-left.svg', semanticsLabel: 'arrow left', color: Style.darkindigo,);
  static final Widget arrowRight = new SvgPicture.asset('assets/svgs/arrow-right.svg', semanticsLabel: 'arrow right', color: Style.darkindigo,);
  static final Widget backToTop = new SvgPicture.asset('assets/svgs/back-to-top.svg', semanticsLabel: 'arrow right', color: Style.darkindigo,);
  static final Widget menu = new SvgPicture.asset('assets/svgs/menu.svg', semanticsLabel: 'menu');
  static final Widget eye = new SvgPicture.asset('assets/svgs/eye.svg', semanticsLabel: 'eye', color: Style.cloudyblue,);
  static final Widget redeye = new SvgPicture.asset('assets/svgs/eye.svg', semanticsLabel: 'redeye', color: Style.lightred,);
  static final Widget rack = new SvgPicture.asset('assets/svgs/rack.svg', semanticsLabel: 'rack', color: Style.cloudyblue,);
  static final Widget bell = new SvgPicture.asset('assets/svgs/bell.svg', semanticsLabel: 'bell', color: Style.cloudyblue,);
  static final Widget image = new SvgPicture.asset('assets/svgs/image.svg', semanticsLabel: 'image', color: Style.cloudyblue,);
  static final Widget redimage = new SvgPicture.asset('assets/svgs/image.svg', semanticsLabel: 'image', color: Style.lightred,);
  static final Widget moon = new SvgPicture.asset('assets/svgs/moon.svg', semanticsLabel: 'moon', color: Style.cloudyblue,);
  static final Widget sun = new SvgPicture.asset('assets/svgs/sun.svg', semanticsLabel: 'sun', color: Style.cloudyblue,);
  static final Widget phone = new SvgPicture.asset('assets/svgs/phone.svg', semanticsLabel: 'phone',);
  static final Widget whatsApp = new SvgPicture.asset('assets/svgs/whats-app.svg', semanticsLabel: 'whatsApp',);
  static final Widget mail = new SvgPicture.asset('assets/svgs/mail.svg', semanticsLabel: 'mail',);
  static final Widget share = new SvgPicture.asset('assets/svgs/share.svg', semanticsLabel: 'share', color: Style.oldred,);
  static final Widget search = new SvgPicture.asset('assets/svgs/search.svg', semanticsLabel: 'search', color: Style.oldred);
  static final Widget setting = new SvgPicture.asset('assets/svgs/setting.svg', semanticsLabel: 'setting', color: Style.darkindigo,);
  static final Widget correct = new SvgPicture.asset('assets/svgs/correct.svg', semanticsLabel: 'correct', color: Style.red,);
  static final Widget incorrect = new SvgPicture.asset('assets/svgs/correct.svg', semanticsLabel: 'correct', color: Style.transparent,);
}
