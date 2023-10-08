import 'package:car_number/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'animating_circles.dart';

class SecondOnBoardingScreen extends StatefulWidget {
  const SecondOnBoardingScreen({super.key});

  @override
  State<SecondOnBoardingScreen> createState() => _SecondOnBoardingScreenState();
}

class _SecondOnBoardingScreenState extends State<SecondOnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const AnimatingCircles(),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: Offset(0, _controller.value * -60),
                      child: Image.asset(
                        "assets/6.png",
                        width: 200,
                        height: 200,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Find fun and interesting quizzes to boost up\nyour knowledge. ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 26, 46, 81),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                    itemCount: onboardingLines.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(
                          Icons.check_circle,
                          color: Color.fromARGB(255, 238, 133, 158),
                        ),
                        title: Text(
                          onboardingLines[index],
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.normal),
                        ),
                        textColor: const Color.fromARGB(255, 26, 46, 81),
                      );
                    }),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 133, 158),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Center(
                    child: Text(
                  "Enter Now",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> onboardingLines = [
  " Play and take quiz challenges together with your friends.",
  " Quiz games allow you to get one step ahead of the rest. ",
  " These quizzes build your general knowledge and also boost your confidence. ",
  " Quiz games bring out the enthusiastic and competitive side in you ",
  " Quizzes also act as an icebreaker at schools, offices, or also, in some cases, at home ",
];
