import 'package:flutter/material.dart';

import '../questions.dart';
import '/screens/result_screen.dart';
import '/widgets/answer_card.dart';
import '/widgets/next_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 198, 228, 255),
      body: Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 148, 198, 255),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    question.question,
                    style: const TextStyle(
                      fontSize: 21,
                      color: Color.fromARGB(255, 26, 46, 81),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: selectedAnswerIndex == null
                          ? () => pickAnswer(index)
                          : null,
                      child: AnswerCard(
                        currentIndex: index,
                        question: question.options[index],
                        isSelected: selectedAnswerIndex == index,
                        selectedAnswerIndex: selectedAnswerIndex,
                        correctAnswerIndex: question.correctAnswerIndex,
                      ),
                    );
                  },
                ),
                isLastQuestion
                    ? RectangularButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => ResultScreen(
                                score: score,
                              ),
                            ),
                          );
                        },
                        label: 'Finish',
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 133, 158),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                              child: Text(
                            "Play Now",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      )
                    : RectangularButton(
                        onPressed: selectedAnswerIndex != null
                            ? goToNextQuestion
                            : null,
                        label: 'Next',
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 133, 158),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                              child: Text(
                            "Play Now",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
