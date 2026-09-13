import 'package:flutter/material.dart';

import 'package:mori/models/tea_model.dart';
import 'package:mori/widgets/custom_app_par.dart';
import 'package:mori/widgets/tea_moment_card.dart';

class TeaDetailsScreen extends StatefulWidget {
  const TeaDetailsScreen({super.key, required this.tea});

  final Tea tea;

  @override
  State<TeaDetailsScreen> createState() => _TeaDetailsScreenState();
}

class _TeaDetailsScreenState extends State<TeaDetailsScreen> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 241, 229),

      appBar: CustomAppPar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 7),

              const Text(
                "TODAY'S RECOMMENDATION",
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Color(0xFF88847C),
                ),
              ),

              const SizedBox(height: 20),

              TeaMomentCard(imagePath: widget.tea.image),

              const SizedBox(height: 35),

              Text(
                widget.tea.category,
                style: const TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Color(0xFF817D74),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.tea.name,
                style: const TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF292A26),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.tea.description,
                style: const TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xFF6F6B63),
                ),
              ),

              const SizedBox(height: 25),

              const Divider(color: Color(0xFFE2DED4)),

              const SizedBox(height: 20),

              const Text(
                "Why You’ll Love It",
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF292A26),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.tea.whyYouLoveIt,
                style: const TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                  color: Color(0xFF6F6B63),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF282A26),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Start My Ritual",
                          style: TextStyle(
                            fontFamily: "Manrope",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isSaved = !isSaved;
                        });
                      },
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: isSaved ? const Color(0xFF7A8F5A) : Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Text(
                    "Save for Later",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111111),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
