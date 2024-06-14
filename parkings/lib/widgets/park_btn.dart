import 'package:flutter/material.dart';

class ParkBtn extends StatelessWidget {
  const ParkBtn({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isEnabled ? () => onPressed() : null,
      child: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: isEnabled
              ? const LinearGradient(
                  colors: [
                    Color(0xff2A74F7),
                    Color(0xff28D5E2),
                  ],
                )
              : null,
          color: isEnabled
              ? null
              : Colors.grey, // Background color for disabled state
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: isEnabled
                    ? Colors.white
                    : Colors.black, // Text color for disabled state
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
