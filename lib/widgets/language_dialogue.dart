import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/languages.dart';
import '../provider/provider.dart';
import 'language_tile.dart';

class LanguageDialogue extends StatelessWidget {
  const LanguageDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        height: 400,
        decoration: _decoration(),
        child: Column(
          children: [
            Text(
              'Selected Language',
              style: h1.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xffBEA5A5)),
            ),
            const SizedBox(
              height: 20,
            ),
            LanguageTile(
              text: "English",
              isActive:
                  context.watch<DataProvider>().language == Languages.english,
              lang: Languages.english,
            ),
            LanguageTile(
              text: "Nepali",
              isActive:
                  context.watch<DataProvider>().language == Languages.nepali,
              lang: Languages.nepali,
            ),
            LanguageTile(
              text: "Hindi",
              isActive:
                  context.watch<DataProvider>().language == Languages.hindi,
              lang: Languages.hindi,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Set Font Size',
              style: h1.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xffBEA5A5)),
            ),
            Slider(
              value: context.watch<DataProvider>().fontSize,
              min: 12,
              max: 50,
              onChanged: (a) {
                Provider.of<DataProvider>(context,listen: false).changeFontSize(a);
              },
              thumbColor: secondaryColor,
              activeColor: secondaryColor,
              inactiveColor: secondaryColor.withOpacity(.15),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(offset: Offset(0, 4), blurRadius: 4, spreadRadius: 0)
        ],
        borderRadius: BorderRadius.circular(10),
      );
}
