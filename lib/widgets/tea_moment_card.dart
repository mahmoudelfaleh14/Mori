import 'package:flutter/material.dart';

class TeaMomentCard extends StatelessWidget {
  const TeaMomentCard({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: 155,
        fit: BoxFit.cover,
      ),
    );
  }
}