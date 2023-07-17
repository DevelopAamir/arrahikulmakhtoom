import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/constants/themes.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:arrahikulmakhtoom/widgets/contact_dialogue.dart';
import 'package:arrahikulmakhtoom/widgets/on_off_btn.dart';
import 'package:arrahikulmakhtoom/widgets/setting_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  static MaterialPageRoute route =
      MaterialPageRoute(builder: (builder) => const SettingPage());
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F0F0),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _background(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Text('Preview',
                        style: h1.copyWith(fontSize: 12,fontWeight: FontWeight.w400)),
                  ),
                  SettingCard(
                    child: Center(
                      child: Text(
                        'In the name of Allah',
                        style: h1.copyWith(
                            fontSize: context.watch<DataProvider>().fontSize,fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SettingCard(
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            "Set Font Size :",
                            style: h1.copyWith(fontSize: 16,fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Slider(
                            value: context.watch<DataProvider>().fontSize,
                            min: 12,
                            max: 50,
                            onChanged: (a) {
                              Provider.of<DataProvider>(context, listen: false)
                                  .changeFontSize(a);
                            },
                            thumbColor: secondaryColor,
                            activeColor: secondaryColor,
                            inactiveColor: secondaryColor.withOpacity(.15),
                          )
                        ],
                      ),
                    ),
                  ),
                  SettingCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Keep Screen :",
                          style: h1.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const OnOffButton()
                      ],
                    ),
                  ),
                   SettingCard(
                    child: Row(
                      children: [
                        const ImageIcon(AssetImage('assets/images/gift.png')),
                        const SizedBox(width: 10,),
                        Text("Support ‘The Ummah Tech’", style: h1.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor),)
                      ],
                    ),
                  ),
                  SettingCard(
                    child: Row(
                      children: [
                        const ImageIcon(AssetImage('assets/images/send2.png')),
                        const SizedBox(width: 10,),
                        Text("Share ‘The Ummah’ App", style: h1.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor),)
                      ],
                    ),
                  ),
                  SettingCard(
                    child: Row(
                      children: [
                       const ImageIcon(AssetImage('assets/images/star1.png')),
                        const SizedBox(width: 10,),
                        Text("Rate & Review", style: h1.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor),)
                      ],
                    ),
                  ),
                  SettingCard(
                    child: Row(
                      children: [
                        const ImageIcon(AssetImage('assets/images/information.png')),
                        const SizedBox(width: 10,),
                        Text("About ‘The Ummah’", style: h1.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor),)
                      ],
                    ),
                  ),
                  SettingCard(
                    child: Row(
                      children: [
                        const ImageIcon(AssetImage('assets/images/security.png')),
                        const SizedBox(width: 10,),
                        Text("Privacy Policy", style: h1.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor),)
                      ],
                    ),
                  ),
                  SettingCard(
                    onTap: (){
                      showDialog(context: context, builder: (context){
                        return const ContactDialogue();
                      });
                    },
                    child: Row(
                      children: [
                        const ImageIcon(AssetImage('assets/images/message2.png')),
                        const SizedBox(width: 10,),
                        Text("Contact Developer", style: h1.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _background() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset('assets/images/landingScreen/downbg.png'));
  }
}
