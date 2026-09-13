import 'package:flutter/material.dart';

class MoodCard extends StatelessWidget {
  const MoodCard({
    super.key,
    required this.texIcon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final String texIcon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? const Color(0xFFDDE8D0) : const Color(0xFFF8F5ED),
        elevation: isSelected ? 4 : 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [Image.asset(texIcon, height: 50)]),

              const SizedBox(height: 5),

              Text(
                subtitle,
                style: const TextStyle(
                  letterSpacing: 1,
                  fontFamily: "Manrope",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
