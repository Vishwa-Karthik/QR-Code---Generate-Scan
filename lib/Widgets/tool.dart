import 'package:flutter/material.dart';

class MyTool extends StatelessWidget {
  const MyTool({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final Icon icon;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.brown[700],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Icon(icon.icon, color: Colors.white, size: 30),
            const SizedBox(height: 4),
            Text(
              text,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
