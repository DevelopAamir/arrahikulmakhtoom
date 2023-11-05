// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:arrahikulmakhtoom/constants/themes.dart';
import 'package:arrahikulmakhtoom/models/lesson.dart';
import 'package:arrahikulmakhtoom/pages/home_page.dart';
import 'package:arrahikulmakhtoom/pages/settings_page.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:arrahikulmakhtoom/utils/utils.dart';
import 'package:arrahikulmakhtoom/widgets/chapter_indecator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../utils/functions.dart';
import '../widgets/bottom_navbar_item.dart';

class ReadingPage extends StatefulWidget {
  final int index;
  final chapterId;
  static MaterialPageRoute route(index, chapterId) => MaterialPageRoute(
      builder: (builder) => ReadingPage(
            index: index,
            chapterId: chapterId,
          ));
  const ReadingPage({Key? key, required this.index, required this.chapterId})
      : super(key: key);

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  late ScrollController scrollController;
  int selectedIndex = 1;
  var controller = PageController(initialPage: 0);
  double offset = 0.0;
  late List<Lesson> totallessons;
  late int lessonIndex;
  late String chapterName;

  @override
  void initState() {
    scrollController = ScrollController(
        initialScrollOffset: Provider.of<DataProvider>(context, listen: false).lastReadChapter== widget.chapterId && Provider.of<DataProvider>(context, listen: false).lastReadIndex == widget.index ? Provider.of<DataProvider>(context, listen: false)
            .lastReadPageOffset: 0);
    getAllLessons();
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.offset > 0) {
          offset = scrollController.offset /
              scrollController.position.maxScrollExtent *
              100;
        }
        if (mounted) {
          setState(() {});
        }
        if (widget.chapterId ==
                Provider.of<DataProvider>(context, listen: false)
                    .lastReadChapter &&
            widget.index ==
                Provider.of<DataProvider>(context, listen: false)
                    .lastReadIndex) {
          Utils().setSettings("last_read_offset", offset);
          Utils().setSettings("last_read_page_offset", scrollController.offset);
          Provider.of<DataProvider>(context, listen: false)
              .setLastReadOffset(offset, scrollController.offset);
        }
      }else{
        Utils().setSettings("last_read_offset", 0);
        Utils().setSettings("last_read_page_offset", 0);
        Provider.of<DataProvider>(context, listen: false)
            .reset();
      }
    });
    _updateReadingListeners();
    Timer(const Duration(microseconds: 1000), () {
      if (widget.chapterId ==
                Provider.of<DataProvider>(context, listen: false)
                    .lastReadChapter &&
            widget.index ==
                Provider.of<DataProvider>(context, listen: false)
                    .lastReadIndex) {
        Utils().setSettings("last_read_offset", offset);
        Utils().setSettings("last_read_page_offset", scrollController.offset);
        Provider.of<DataProvider>(context, listen: false)
            .setLastReadOffset(offset, scrollController.offset);
      }else{
         Utils().setSettings("last_read_offset", 0);
        Utils().setSettings("last_read_page_offset", 0);
        Provider.of<DataProvider>(context, listen: false)
            .reset();
      }
    });

    super.initState();
  }

  getAllLessons([index]) {
    totallessons = Provider.of<DataProvider>(context, listen: false)
        .chapters
        .firstWhere((element) => element.id == widget.chapterId)
        .lesson;
    lessonIndex = widget.index;
    chapterName = Provider.of<DataProvider>(context, listen: false)
        .chapters
        .firstWhere((element) => element.id == widget.chapterId)
        .chapterName;
    if (mounted) {
      setState(() {});
    }
  }

  _updateReadingListeners() {
    Utils().setSettings("last_read_index", lessonIndex);
    Utils().setSettings("last_read_chapter", widget.chapterId);
    Timer(const Duration(microseconds: 1000), () {
      Provider.of<DataProvider>(context, listen: false)
          .setLastRead(lessonIndex, widget.chapterId);
    });
  }

  @override
  Widget build(BuildContext context) {
    if(context.watch<DataProvider>().lastReadChapter == widget.chapterId && context.watch<DataProvider>().lastReadIndex == widget.index){
      offset = context.watch<DataProvider>().lastReadOffset;
    }
   
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
      ),
      bottomNavigationBar: _bottomNavBar(context),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [_topPart(context), const SettingPage()],
        ),
      ),
    );
  }

  Column _topPart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _progressIndicatorAsPage(),
        ChapterIndicatorCard(
          chapterName: chapterName,
          lessonName: totallessons[lessonIndex].title,
          progressed: offset,
          left: () {
            if (lessonIndex > 0) {
              scrollController.jumpTo(0);
              Utils().setSettings("last_read_offset", 0);
              Utils().setSettings("last_read_page_offset", 0);
              Provider.of<DataProvider>(context, listen: false)
                  .setLastReadOffset(0, 0);
              setState(() {
                lessonIndex--;
                offset = 0;
              });
              _updateReadingListeners();
            }
          },
          right: () {
            if (totallessons.length - 1 > lessonIndex) {
              scrollController.jumpTo(0);
              Utils().setSettings("last_read_offset", 0);
              Utils().setSettings("last_read_page_offset", 0);
              Provider.of<DataProvider>(context, listen: false)
                  .setLastReadOffset(0, 0);
              setState(() {
                lessonIndex++;
                offset = 0;
              });
              _updateReadingListeners();
            }
          },
        ),
        _content(),
      ],
    );
  }

  Padding _progressIndicatorAsPage() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Text("Topic ${lessonIndex + 1} of ${totallessons.length}",
          style: smallSecondaryText),
    );
  }

  _content() {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              totallessons[lessonIndex].content,
              style: TextStyle(
                  fontSize: context.watch<DataProvider>().fontSize,
                  fontFamily: Utils.getFonts(context)),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavBar(context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 25,
      items: bottomNavigationBarItems(selectedIndex),
      currentIndex: selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: primaryColor,
      onTap: (index) async {
        if (index == 0) {
          Navigator.popUntil(context, (route) => route == Homepage.route);
        } else if (index == 2) {
          showLanguageChange(context);
        } else if (index == 1) {
          setState(() {
            selectedIndex = index;
          });

          await controller.animateToPage(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        } else if (index == 3) {
          setState(() {
            selectedIndex = index;
          });

          await controller.animateToPage(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    super.dispose();
  }
}
