import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/enums/languages.dart';
import 'package:flutter/material.dart';


class RoundedCheckBox extends StatefulWidget {
  final bool value;
  final Languages lang;
  const RoundedCheckBox({super.key, required this.value, required this.lang});

  @override
  State<RoundedCheckBox> createState() => _RoundedCheckBoxState();
}

class _RoundedCheckBoxState extends State<RoundedCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: widget.value
              ? const Icon(
                  Icons.check_circle,
                  weight: 500,
                  size: 25.0,
                  color: Colors.white,
                )
              : const Icon(Icons.circle_outlined,
                  size: 25.0, color: secondaryColor),
        ));
  }
}
