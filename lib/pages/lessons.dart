import 'package:arrahikulmakhtoom/constants/themes.dart';
import 'package:arrahikulmakhtoom/pages/reading_page.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:arrahikulmakhtoom/widgets/texttile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonScreen extends StatelessWidget {
  final String chatperId;
  static MaterialPageRoute route(chapterID) => MaterialPageRoute(
      builder: (builder) => LessonScreen(chatperId: chapterID));
  const LessonScreen({super.key, required this.chatperId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/landingScreen/downbg.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                child: Text(context.watch<DataProvider>().chapters.firstWhere((element) => element.id == chatperId).chapterName, style: h1, textAlign: TextAlign.center,)),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: context.watch<DataProvider>().chapters.firstWhere((element) => element.id == chatperId).lesson.length,
                itemBuilder: (context, index) {
                  
                  return TextTile(
                    index: index,
                    isLesson: true,
                    chapterId: chatperId,
                    onTap: () =>
                        Navigator.push(context, ReadingPage.route(index, chatperId)),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
