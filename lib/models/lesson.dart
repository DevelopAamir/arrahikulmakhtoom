// ignore_for_file: prefer_typing_uninitialized_variables

class Lesson{
  final id;
  final title;
  final content;
  Lesson(this.id, this.title, this.content);
  factory Lesson.fromMap(Map<String, dynamic> data){
    return Lesson(data['Id'], data['Topic'], data['Lesson']);
  }

}