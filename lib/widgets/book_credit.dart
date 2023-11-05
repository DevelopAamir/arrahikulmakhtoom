// ignore_for_file: unnecessary_string_escapes

import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class BookCreditCard extends StatelessWidget {
  BookCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _backgroundcard(),
          Positioned(
            bottom: 25,
            left: 20,
            child: Image.asset(
              'assets/images/landingScreen/bookimg.png',
              height: 180,
              width: 130,
            ),
          ),
        ],
      ),
    );
  }

  Container _backgroundcard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 136,
      width: double.infinity,
      decoration: _cardDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: SizedBox()),
          credits(),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset('assets/images/landingScreen/bookcarddesign.png',
                height: 79),
          ),
        ],
      ),
    );
  }

  Expanded credits() {
    return Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "c/{xLsÞ'n dvÞt\"d",
                style: h1.copyWith(fontFamily: 'Preeti',fontSize: 25),
              ),
              const Text(
                ';L/t–pg–gla',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Preeti',
                    fontWeight: FontWeight.w500,
                    color: secondaryTextColor),
              ),
              const Text(
                ";kmlo\o'/{xdfg d'af/sk'/L",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Preeti',
                    color: secondaryTextColor),
              ),
              _languageIndicator(),
            ],
          ),
        );
  }

  final BoxDecoration _cardDecoration = BoxDecoration(
    color: cardsColor,
    borderRadius: BorderRadius.circular(10),
  );

  _languageIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: DottedBorder(
        padding: const EdgeInsets.all(5),
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: primaryColor.withOpacity(.2),
        strokeWidth: .5,
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "English",
                style: TextStyle(fontSize: 10),
              ),
              VerticalDivider(color: primaryColor.withOpacity(.1),),
             
              const Text(
                "g]kfnL",
                style: TextStyle(fontSize: 15,fontFamily: 'Preeti'),
              ),
              VerticalDivider(color: primaryColor.withOpacity(.1),),
              const Text(
                "lxGbL",
                style: TextStyle(fontSize: 15,fontFamily: 'Preeti'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
