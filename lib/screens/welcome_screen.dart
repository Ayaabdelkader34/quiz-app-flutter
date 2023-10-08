import 'package:car_number/screens/quiz__screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _secureText = true;
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(alignment: Alignment.bottomCenter, children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/1.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 110,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                maxRadius: 40,
                minRadius: 40,
                backgroundImage: AssetImage("assets/2.jpg"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Stefn Fancik",
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 46, 81),
                  fontSize: 24,
                  fontFamily: "SF Pro Disbly",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "The journey of a thousand\nmiles begins with a single step",
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 46, 81),
                  fontSize: 14,
                  fontFamily: "SF Pro Disbly",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          width: double.infinity,
          height: 520,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                " Programs aptitude test\n -#0107                                ",
                style: TextStyle(
                  fontSize: 29,
                  fontFamily: "SF Pro Disbly",
                  color: Color.fromARGB(255, 26, 46, 81),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      "  Created by ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "SF Pro Disblay Pro",
                      ),
                    ),
                    Text(
                      "Aya Abdelkader",
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 46, 81),
                        fontSize: 16,
                        fontFamily: "SF Pro Disblay Pro",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 340,
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "This Field cannot be empty!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    helperStyle: const TextStyle(
                      color: Color.fromARGB(255, 26, 46, 81),
                      fontFamily: "SF Pro Disblay ProRR",
                      fontSize: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: const Color(0xff4A4845).withOpacity(0.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: const Color(0xff4A4845).withOpacity(0.1),
                      ),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    iconColor: Colors.grey[400],
                  ),
                  obscureText: _secureText,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 175, 212, 255),
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
                      Text(
                        "Join test",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SF Pro Disblay Pro",
                          color: Color.fromARGB(255, 26, 46, 81),
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
