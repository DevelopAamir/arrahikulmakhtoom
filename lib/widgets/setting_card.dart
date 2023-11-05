import 'package:flutter/material.dart';


class SettingCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const SettingCard({super.key, required this.child,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.6),
        height: 50,
        width: double.infinity,
        decoration: _decoration(),
        child: child,
      ),
    );
  }
  
  _decoration() {
    return BoxDecoration(
      color: const Color(0xffF4F0F0),
      border: Border.all(color: const Color(0xffFDF9F6)),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 6,
          spreadRadius: 0,
          color: Colors.grey.withOpacity(.15)
        )
      ],
      borderRadius: BorderRadius.circular(6)
    
    );
  }
}