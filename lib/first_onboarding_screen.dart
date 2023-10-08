import 'package:car_number/second_onboarding_screen.dart';
import 'package:flutter/material.dart';

class FirstOnBoardingScreen extends StatefulWidget {
  const FirstOnBoardingScreen({super.key});

  @override
  State<FirstOnBoardingScreen> createState() => _FirstOnBoardingScreenState();
}

class _FirstOnBoardingScreenState extends State<FirstOnBoardingScreen> {
  double buttonOffset = 0.0;

  Offset imageOffset = Offset.zero;
  String titleText = "Quizzo App";
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width - 80;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 228, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              titleText,
              style: const TextStyle(
                  fontSize: 54,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 26, 46, 81)),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Center(
            child: Text(
              "Create,share and play quizzes whenver you want!",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 26, 46, 81),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Transform(
            transform: Matrix4.translationValues(imageOffset.dx, 0, 0)
              ..rotateZ((imageOffset.dx / 20) * 3.14 / 180),
            child: GestureDetector(
              onPanUpdate: (details) {
                if (imageOffset.dx.abs() <= 120) {
                  setState(() {
                    imageOffset = Offset(imageOffset.dx + details.delta.dx, 0);
                    titleText = "Let's Join !";
                  });
                }
              },
              onPanEnd: (_) {
                setState(() {
                  imageOffset = Offset.zero;
                  titleText = "Quizzo App";
                });
              },
              child: SizedBox(
                width: 310,
                height: 310,
                child: Image.asset("assets/4.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0 && buttonOffset <= buttonWidth - 80) {
                setState(() {
                  buttonOffset += details.delta.dx;
                });
              }
            },
            onPanEnd: (_) {
              if (buttonOffset > buttonWidth / 2) {
                setState(() {
                  buttonOffset = buttonWidth - 80;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondOnBoardingScreen()));
              } else {
                setState(() {
                  buttonOffset = 0.0;
                });
              }
            },
            child: Container(
              width: buttonWidth,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    width: buttonOffset + 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 147, 177, 238),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    duration: const Duration(microseconds: 200),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 80,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 26, 46, 81),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.chevron_right,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Get Started !",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 46, 81),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
