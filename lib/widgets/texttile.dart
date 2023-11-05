// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/functions.dart';

class TextTile extends StatelessWidget {
  final int index;
  final bool isLesson;
  final chapterId;
  final Function() onTap;

  TextTile({super.key, required this.index, required this.onTap, this.isLesson =false, this.chapterId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 7.4),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: _decoration,
          child:  IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  isLesson ? parseRoman((index) + 1): (index + 1).toString(),
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  width: 20,
                ),
                VerticalDivider(color: primaryColor.withOpacity(.2),),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  
                  flex: 9,
                  fit: FlexFit.tight,
                  child: SizedBox(
                    
                    child: Text(
                      isLesson? context.watch<DataProvider>().chapters.firstWhere((element) => element.id == chapterId).lesson[index].title: context.watch<DataProvider>().chapters[index].chapterName.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14,),
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, size: 16  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: cardsColor,
  );
}
