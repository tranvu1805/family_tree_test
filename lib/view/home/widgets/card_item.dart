import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.title,
      required this.iconData,
      required this.buttonTitle,
      required this.color,
      required this.onTap});
  final String title;
  final IconData iconData;
  final String buttonTitle;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(iconData), Text(buttonTitle)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
