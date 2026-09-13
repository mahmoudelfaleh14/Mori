import 'package:flutter/material.dart';

class CustomAppPar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppPar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 245, 241, 229),
      elevation: 0,

      title: Row(
        children: [
          Image.asset("assets/images/AppBarIcon.png", width: 30, height: 30),
          const Text(
            " M O R I",
            style: TextStyle(
              fontFamily: "Manrope",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF292A26),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
