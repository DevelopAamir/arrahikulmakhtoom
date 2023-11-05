import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/constants/themes.dart';
import 'package:arrahikulmakhtoom/enums/languages.dart';
import 'package:arrahikulmakhtoom/widgets/rounded_check_box.dart';
import 'package:flutter/material.dart';
import '../utils/functions.dart';

class LanguageTile extends StatelessWidget {
  final bool isActive;
  final String text;
  final Languages lang;
  const LanguageTile(
      {super.key,
      this.isActive = false,
      required this.text,
      required this.lang});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changgeLanguage(context,lang);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        decoration: _decoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: h1.copyWith(
                    color: isActive ? Colors.white : null,
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
            RoundedCheckBox(value: isActive, lang: lang)
          ],
        ),
      ),
    );
  }

  _decoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      color: isActive ? secondaryColor : Colors.white,
      border: Border.all(color: secondaryColor));
}
