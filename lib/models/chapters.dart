// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:arrahikulmakhtoom/models/lesson.dart';

class Chapter{
  final id;
  final chapterName;
  final List<Lesson> lesson;
  Chapter(this.id, this.chapterName, this.lesson);
  factory Chapter.fromMap(Map<String, dynamic> data,lesson){
    return Chapter(data['Id'], data['Chapter'], lesson);
  }
}

