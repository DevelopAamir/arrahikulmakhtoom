import 'package:flutter/material.dart';

class ContactDialogue extends StatelessWidget {
  const ContactDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: const Text(
        "Contact developer",
        
      ),
      content: const Text(
        "Name: MD Aamir\nEmail: mdamirten@gmail.com\nWhatsapp: +977 982 637 0489",
        
        style: TextStyle(height: 1.5, fontSize: 16),

      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close"),
        ),
      ],
    );
  }
}
