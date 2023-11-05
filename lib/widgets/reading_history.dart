import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/constants/themes.dart';
import 'package:arrahikulmakhtoom/pages/reading_page.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadingHistoryCard extends StatelessWidget {
  final double progressed;
  ReadingHistoryCard({
    super.key, required this.progressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        var prov = Provider.of<DataProvider>(context, listen: false);
          Navigator.push(context, ReadingPage.route(prov.lastReadIndex, prov.lastReadChapter));
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.only(left: 20,right: 20, bottom: 12.6),
        decoration: _decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(context),
            _middle(context),
            _chapterIndicator(context),
            _progressBar(context),
          ],
        ),
      ),
    );
  }

  Widget _chapterIndicator(context) {
    final chapter = Provider.of<DataProvider>(context).chapters.firstWhere((element) => element.id == Provider.of<DataProvider>(context, listen: false).lastReadChapter);
    return Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10, top: 5, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Text(

                  chapter.lesson[Provider.of<DataProvider>(context).lastReadIndex].title,
                  overflow: TextOverflow.ellipsis,
                  style: smallSecondaryText.copyWith(fontSize: 12),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "Topic ${Provider.of<DataProvider>(context).lastReadIndex + 1} of ${chapter.lesson.length}",
                  style: smallSecondaryText,
                ),
              ),
            ],
          ),
        );
  }

  Widget _middle(context) {
    final chapter = Provider.of<DataProvider>(context, listen: false).chapters.firstWhere((element) => element.id == Provider.of<DataProvider>(context, listen: false).lastReadChapter);
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            chapter.chapterName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        );
  }

  Widget _topBar(BuildContext context) {
    final prov = Provider.of<DataProvider>(context, listen: false);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ImageIcon(
            AssetImage('assets/images/landingScreen/reading_history.png'),
            size: 32,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: _topbarDecoration,
          child:  Text(
            prov.lastReadChapter == '1.0' && prov.lastReadIndex == 0 && prov.lastReadOffset == 0?'Start Reading' : 'Continue Reading',
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ],
    );
  }

  final _topbarDecoration = const BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(14),
        bottomLeft: Radius.circular(14),
      ));

  final BoxDecoration _decoration = BoxDecoration(
    color: cardsColor,
    borderRadius: BorderRadius.circular(14),
  );

  Widget _progressBar(context){
    return AnimatedContainer(
      
      duration: const Duration(milliseconds: 500),
      height: 7,
      width: (MediaQuery.of(context).size.width - 40)/ 100* progressed,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(14),
    ),);
  }
}
