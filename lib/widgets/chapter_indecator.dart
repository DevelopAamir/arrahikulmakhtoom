import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/constants/themes.dart';
import 'package:flutter/material.dart';

class ChapterIndicatorCard extends StatelessWidget {
  final double progressed;
  final Function()? left;
  final Function()? right;
  final String chapterName;
  final String lessonName;
  const ChapterIndicatorCard({super.key, required this.progressed, this.left, this.right, required this.chapterName, required this.lessonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.6),
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 100,
      decoration: _decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _leftSide(),
                  _middle(),
                  _rightSide(),
                ],
              ),
            ),
          ),
          _progressBar(context),
        ],
      ),
    );
  }

  _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: cardsColor,
      boxShadow: [
        BoxShadow(
          color: const Color(0xff000000).withOpacity(.15),
          offset: const Offset(0, 4),
          blurRadius: 4,
        ),
      ],
    );
  }

  _leftSide() {
    return  IconButton(
      onPressed: left,
      icon:  const Icon(
        Icons.arrow_back_ios,
        color: disabledColor,
      ),
    );
  }

  _rightSide() {
    return  IconButton(
      onPressed: right,
      icon:  const Icon(
        Icons.arrow_forward_ios,
        color: disabledColor,
      ),
    );
  }

  _middle() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chapterName,
            style: h1.copyWith(fontSize: 17),
            textAlign: TextAlign.center
          ),
          const SizedBox(height: 2,),
          Text(
            lessonName,
            textAlign: TextAlign.center,
            style:
                smallSecondaryText.copyWith(fontSize: 11, color: primaryColor),
          ),
        ],
      ),
    );
  }

  _progressBar(context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 5,
      width: (MediaQuery.of(context).size.width - 40)/ 100* progressed,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
        color: primaryColor,
      ),
    );
  }
}
