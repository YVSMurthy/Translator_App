import 'package:flutter/material.dart';
import '/pages/text_to_text.dart';
import '/pages/speech_to_speech.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.fromLTRB(5, 50, 5, 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: w * 0.874,
                height: h * 0.15,
                decoration: BoxDecoration(
                  color: Color(0xffA3DFE9),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children: [
                    Image.asset(
                      'assets/book.png',
                      width: 0.3*w,
                      height: 0.1*h,
                      fit: BoxFit.contain,
                    ),
                    Expanded( // Adjust width of the Column dynamically
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Let's break down language barriers together.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                  ]
                ),
              ),

              SizedBox(height: 50),

              Text(
                "Services",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TextToText()),
                      );
                    },

                    child: Container(
                      width: w*0.85,
                      height: h*0.15,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFDCDCFF),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/text.png',
                            width: 0.15*w,
                            height: 0.15*h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: Text(
                              "Type your text and instantly get it translated into your desired language.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                              )
                            ),
                          )
                        ],
                      ),
                    ),

                  ),
                  
                  SizedBox(height: 40),

                  GestureDetector( 
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SpeechToSpeech()),
                      );
                    },

                    child: Container(
                      width: w*1.5,
                      height: h*0.15,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9D5B5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Speak or record your voice, and our app will translate it into the language you choose.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                              )
                            ),
                          ),
                          SizedBox(width: 15),
                          Image.asset(
                            'assets/mic1.png',
                            width: 0.15*w,
                            height: 0.15*h,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  GestureDetector( 
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TextToText()),
                      );
                    },

                    child: Container(
                      width: w*0.85,
                      height: h*0.15,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFA1A1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/translate.png',
                            width: 0.15*w,
                            height: 0.15*h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: Text(
                              "Two-way real-time translation for smooth live chat communication.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
