import 'package:arrahikulmakhtoom/pages/home_page.dart';
import 'package:arrahikulmakhtoom/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';
import '../provider/provider.dart';
import '../widgets/language_dialogue.dart';

parseRoman(int number) {
  List roman = [
    '0',
    'I',
    'II',
    'III',
    'IV',
    'V',
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI',
    'XII',
    'XIII',
    'XIV',
    'XV',
    'XVI',
    'XVII',
    'XVIII',
    'XIX',
    'XX'
  ];
  return roman[number];
}

showLanguageChange(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const Align(
          alignment: Alignment.bottomCenter,
          child: LanguageDialogue(),
        );
      });
}

changgeLanguage(context, lang) {
  Provider.of<DataProvider>(context, listen: false).reset();
  Utils().setSettings("last_read_offset", "");
  Utils().setSettings("last_read_page_offset", "");
  Utils().setSettings("last_read_chapter", "");
  Utils().setSettings("last_read_index", "");
  Utils().loadContent(context, lang).then((value) {
    Provider.of<DataProvider>(context, listen: false).changeLanguage(lang);
    Navigator.popUntil(context, (route) => route == Homepage.route);
  });
}

setAlwaysOn(bool value) {
  if (value) {
    Wakelock.enable();
  } else {
    Wakelock.disable();
  }
}
