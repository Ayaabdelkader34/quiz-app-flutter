import 'package:car_number/screens/quiz__screen.dart';
import 'package:flutter/material.dart';

import '../questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 198, 228, 255),
      body: SingleChildScrollView(
        child: Container(
          // margin: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.topCenter,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 49,
              ),
              SizedBox(
                width: 260,
                height: 240,
                child: Image.asset(
                  "assets/12.png",
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Congratulations",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 26, 46, 81)),
                  ),
                  SizedBox(
                      width: 30,
                      height: 40,
                      child: Image.asset("assets/3.png")),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      value: score / 9,
                      color: const Color.fromARGB(255, 175, 212, 255),
                      backgroundColor: const Color.fromARGB(255, 255, 168, 189),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        score.toString(),
                        style: const TextStyle(
                          fontSize: 80,
                          color: Color.fromARGB(255, 26, 46, 81),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${(score / questions.length * 100).round()}%',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 26, 46, 81),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "That's so great! You have completed the questions. ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 26, 46, 81),
                  ),
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              Container(
                width: 350,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 175, 212, 255),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      " Ok, Done",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "SF Pro Disblay Pro",
                        color: Color.fromARGB(255, 26, 46, 81),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                width: 350,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 168, 189),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_new_sharp,
                      ),
                      Text(
                        " Review the answer",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "SF Pro Disblay Pro",
                            color: Color.fromARGB(255, 26, 46, 81)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
