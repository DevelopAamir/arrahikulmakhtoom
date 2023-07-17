import 'package:arrahikulmakhtoom/pages/lessons.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:arrahikulmakhtoom/widgets/reading_history.dart';
import 'package:arrahikulmakhtoom/widgets/texttile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/book_credit.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({
    super.key,
  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget(),
        foregroundWidget(),
      ],
    );
  }

  Widget backgroundWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/landingScreen/top.png'),
        Image.asset('assets/images/landingScreen/downbg.png'),
      ],
    );
  }

  foregroundWidget() {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            backgroundColor: Colors.transparent,
            expandedHeight: 320.0,
            flexibleSpace: FlexibleSpaceBar(
              background: BookCreditCard(),
            ),
          ),
          SliverToBoxAdapter(
            child: ReadingHistoryCard(
              progressed: context.watch<DataProvider>().lastReadOffset.toDouble(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final data = Provider.of<DataProvider>(context,listen: false).chapters;
                return TextTile(
                  index: index,
                  onTap: () => Navigator.push(context, LessonScreen.route(data[index].id)),
                );
              },
              childCount: context.watch<DataProvider>().chapters.length,
            ),
          ),
        ],
      ),
    );
  }
}
