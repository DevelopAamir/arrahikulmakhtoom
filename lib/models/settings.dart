import 'package:arrahikulmakhtoom/enums/languages.dart';

class Settings{
  int fontSize;
  Languages languages;
  bool isAllwaysOn;
  Settings(this.fontSize, this.languages, this.isAllwaysOn);
  factory Settings.fromMap(Map<String, dynamic> data){
    return Settings(int.parse(data['fontsize']), data['language'],  data['isAllwaysOn']);
  }
}