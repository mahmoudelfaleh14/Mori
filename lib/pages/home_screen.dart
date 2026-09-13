import 'package:flutter/material.dart';
import 'package:mori/models/tea_model.dart';

import 'package:mori/pages/Tea_details_screen.dart';
import 'package:mori/widgets/custom_app_par.dart';
import 'package:mori/widgets/mood_card.dart';
import 'package:mori/widgets/tea_moment_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedMood = -1;
  bool showError = false;

  final List<Tea> teas = [
    Tea(
      image: "assets/images/TeaCalm.png",
      category: "JASMINE GREEN TEA",
      name: "Jasmine Green Tea",
      description:
          "A delicate green tea scented with jasmine blossoms, created for quiet moments when you want to slow down, breathe deeply, and let the noise of the day fade away.",
      whyYouLoveIt:
          "Light, floral, and beautifully refreshing. The soft jasmine aroma creates a peaceful ritual, while the clean green tea finish leaves you feeling calm, balanced, and gently refreshed.",
    ),
    Tea(
      image: "assets/images/green_tea.png",
      category: "SENCHA GREEN TEA",
      name: "Mindful Sencha",
      description:
          "A crisp and vibrant Japanese-style green tea with fresh herbal notes and a clean finish, perfect for moments when you want to clear your head and bring your attention back to what matters.",
      whyYouLoveIt:
          "Bright and focused without feeling heavy. Its fresh character makes it an ideal companion for reading, studying, planning your day, or simply enjoying a few minutes of uninterrupted clarity.",
    ),
    Tea(
      image: "assets/images/peppermint_tea.png",
      category: "PEPPERMINT HERBAL TEA",
      name: "Peppermint Comfort",
      description:
          "A cooling herbal infusion with naturally refreshing peppermint leaves, made for cozy evenings, quiet corners, and those little moments when you want everything to feel a little slower.",
      whyYouLoveIt:
          "Cool, soothing, and incredibly comforting. The bright peppermint aroma turns an ordinary cup into a relaxing ritual that feels warm, familiar, and easy to come back to.",
    ),
    Tea(
      image: "assets/images/hibiscus_tea.png",
      category: "HIBISCUS HERBAL TEA",
      name: "Hibiscus Glow",
      description:
          "A vibrant ruby-red herbal infusion with bright fruity notes and a pleasantly tangy finish, designed to bring a little energy, color, and freshness to your moment.",
      whyYouLoveIt:
          "Bold, lively, and refreshing from the first sip. Hibiscus brings a bright twist to your tea ritual, making it a great choice when you want something expressive, uplifting, and full of character.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 241, 229),

      appBar: const CustomAppPar(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 30),

            const Text(
              "Personal Tea Ritual",
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                color: Color(0xFF88847C),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "How do you want to feel today?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),

            const SizedBox(height: 20),

            const Text(
              "Choose a mood and we'll find a tea for your moment.",
              style: TextStyle(
                letterSpacing: 2,
                fontFamily: "Manrope",
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 40),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 1.3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MoodCard(
                  texIcon: "assets/images/CalmLogo.png",
                  title: "Calm",
                  subtitle: "Quiet Your Mind",
                  isSelected: selectedMood == 0,
                  onTap: () {
                    setState(() {
                      selectedMood = 0;
                      showError = false;
                    });
                  },
                ),

                MoodCard(
                  texIcon: "assets/images/Focused.png",
                  title: "Focused",
                  subtitle: "Clear Your Thoughts",
                  isSelected: selectedMood == 1,
                  onTap: () {
                    setState(() {
                      selectedMood = 1;
                      showError = false;
                    });
                  },
                ),

                MoodCard(
                  texIcon: "assets/images/Cozyy.png",
                  title: "Cozy",
                  subtitle: "Slow Down Gently",
                  isSelected: selectedMood == 2,
                  onTap: () {
                    setState(() {
                      selectedMood = 2;
                      showError = false;
                    });
                  },
                ),

                MoodCard(
                  texIcon: "assets/images/Energized.png",
                  title: "Energized",
                  subtitle: "Lift Your Spirit",
                  isSelected: selectedMood == 3,
                  onTap: () {
                    setState(() {
                      selectedMood = 3;
                      showError = false;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Your Moment",
              style: TextStyle(
                letterSpacing: 2,
                fontFamily: "Manrope",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 10),

            TeaMomentCard(
              imagePath: selectedMood == -1
                  ? "assets/images/TeaBAsic.png"
                  : teas[selectedMood].image,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedMood == -1) {
                    setState(() {
                      showError = true;
                    });
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TeaDetailsScreen(tea: teas[selectedMood]),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF282A26),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discover My Tea"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),

            if (showError)
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    "Choose a mood to discover your tea.",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8A6658),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
