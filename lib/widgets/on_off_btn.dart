import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:arrahikulmakhtoom/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class OnOffButton extends StatelessWidget {

  const OnOffButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Utils().setSettings('isAlwaysOn', (!Provider.of<DataProvider>(context,listen: false).isAllwaysOn).toString());
        Provider.of<DataProvider>(context, listen: false).changeisAllwaysOn();
      },
      child: Container(
        width: 150,
        height: 30,
        decoration: _decoration(),
        child: Center(
          child: context.watch<DataProvider>().isAllwaysOn? const Text('On'): const Text('Off'),
        ),
      ),
    );
  }
  
  _decoration() {
    return BoxDecoration(
      color: const Color(0xffFDF9F6),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 6,
          spreadRadius: 0,
          color: Colors.grey.withOpacity(.15)
        )
      ]
    );
  }
}