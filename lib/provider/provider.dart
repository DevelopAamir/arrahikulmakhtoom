import 'package:arrahikulmakhtoom/enums/languages.dart';
import 'package:arrahikulmakhtoom/models/Settings.dart';
import 'package:arrahikulmakhtoom/models/chapters.dart';
import 'package:arrahikulmakhtoom/utils/functions.dart';
import 'package:arrahikulmakhtoom/utils/utils.dart';

import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  double fontSize = 12.0;
  Languages language = Languages.english;
  List<Chapter> chapters = [];
  int lastReadIndex = 0;
  String lastReadChapter = '1.0';
  double lastReadOffset = 0;
  double lastReadPageOffset = 0;
  bool isAllwaysOn = false;
  changeLanguage(lang) {
    language = lang;
    Utils().setSettings("language",Utils().lngToStr(lang));
    notifyListeners();
  }

  changeFontSize(value) {
    fontSize = value;
    Utils().setSettings("fontsize",value.toString());
    notifyListeners();
  }

  initChapters(data) {
    chapters = data;
    notifyListeners();
  }

  setSettings(Settings data) {
    fontSize = data.fontSize.toDouble();
    language = data.languages;
    isAllwaysOn = data.isAllwaysOn;
    setAlwaysOn(data.isAllwaysOn);
    notifyListeners();
  }

  setLastRead(index, chapter) {
    if (index != "") {
      lastReadIndex = int.parse(index.toString());
    }
    if (chapter != "") {
      lastReadChapter = chapter;
    }
    notifyListeners();
  }

  setLastReadOffset(offset, pageOffset){
     if(offset != ""){
      lastReadOffset = double.parse(offset.toString());
    }
    if(pageOffset != ""){
      lastReadPageOffset = double.parse(pageOffset.toString());
    }
    notifyListeners();
  }
  reset(){
    lastReadChapter ="1.0";
    lastReadIndex = 0;
    lastReadOffset = 0;
    lastReadPageOffset = 0;
    notifyListeners();
  }
  changeisAllwaysOn(){
    isAllwaysOn = !isAllwaysOn;
    setAlwaysOn(isAllwaysOn);
    notifyListeners();
  }
 
}
