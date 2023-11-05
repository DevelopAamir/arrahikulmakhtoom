// ignore_for_file: use_build_context_synchronously

import 'package:arrahikulmakhtoom/enums/languages.dart';
import 'package:arrahikulmakhtoom/models/Settings.dart';
import 'package:arrahikulmakhtoom/models/chapters.dart';
import 'package:arrahikulmakhtoom/models/lesson.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:arrahikulmakhtoom/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Utils {
  static getFonts(BuildContext context) {
    Languages lang = context.watch<DataProvider>().language;
    if (lang == Languages.english) {
      return null;
    } else if (lang == Languages.hindi) {
      return 'TiroDevanagariHindi';
    } else if (lang == Languages.nepali) {
      return 'Preeti';
    }
  }

  Map _queryChapters(Languages lang) {
    switch (lang) {
      case Languages.english:
        {
          return {"lang": "chapters_english", "limit": 48};
        }
      case Languages.nepali:
        {
          return {"lang":"chapters_nepali", "limit": 66};
        }
      case Languages.hindi:
        {
          return {"lang": "chapters_hindi", "limit": 66};
        }
    }
  }

  String _queryLesson(Languages lang) {
    switch (lang) {
      case Languages.english:
        {
          return "lessons_english";
        }
      case Languages.nepali:
        {
          return "lessons_nepali";
        }
      case Languages.hindi:
        {
          return "lessons_hindi";
        }
    }
  }

  Languages strToLang(text){
    switch (text) {
      case 'english':{
        return Languages.english;
      }
      case "nepali": {
        return Languages.nepali;
      }

      case "hindi": {
        return Languages.hindi;
      }
      default:{
        return Languages.english;
      }
    }
  }
  String lngToStr(lng){
    switch (lng) {
      case Languages.english:{
        return 'english';
      }
      case Languages.nepali: {
        return "nepali";
      }

      case Languages.hindi: {
        return  "hindi";
      }
      default:{
        return "english";
      }
    }
  }

  Future loadContent(BuildContext context,[lang]) async {
    final database = await DatabaseHelper().initializeDatabase();
    Map query = _queryChapters(lang??Provider.of<DataProvider>(context, listen: false).language);
    final response = await database.query(query['lang'],limit:query['limit']);
    List lessons = await database.query(_queryLesson(lang??Provider.of<DataProvider>(context, listen: false).language));

    List data =  response.map((e) {
      return Chapter.fromMap(e, lessons.where((element) => element['chapter_id']== e['Id']).map((f) => Lesson.fromMap(f)).toList());
    }).toList();
    Provider.of<DataProvider>(context, listen: false).initChapters(data);
  }
  Future getSetting(BuildContext context)async{
      final database = await DatabaseHelper().initializeDatabase();
      final settings = await database.query("settings");
      final fontSize= settings.firstWhere((element) => element['key']== 'fontsize')['value'];
      final language= settings.firstWhere((element) => element['key']== 'language')['value'];
      final isAlwaysOn= settings.firstWhere((element) => element['key']== 'isAlwaysOn')['value'];
      final lastReadIndex = settings.firstWhere((element) => element['key']== 'last_read_index')['value'];
      final lastReadChapter = settings.firstWhere((element) => element['key']== 'last_read_chapter')['value'];
      final lastReadOffset = settings.firstWhere((element) => element['key']== 'last_read_offset')['value'];
      final lastReadPageOffset = settings.firstWhere((element) => element['key']== 'last_read_page_offset')['value'];
      Provider.of<DataProvider>(context, listen: false).setLastRead(lastReadIndex.toString(), lastReadChapter);
      Provider.of<DataProvider>(context,listen:false).setLastReadOffset(lastReadOffset,lastReadPageOffset);
      Provider.of<DataProvider>(context, listen: false).setSettings(Settings(double.parse(fontSize.toString()).toInt(),strToLang(language), isAlwaysOn == "true" ));
    }
  Future setSettings(key, value)async{
    final database = await DatabaseHelper().initializeDatabase();
    await database.update("settings", {"key": key, "value": value}, where: "key = ?", whereArgs: [key]);
  }
}
