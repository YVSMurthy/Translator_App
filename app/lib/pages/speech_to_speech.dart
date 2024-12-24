import 'package:flutter/material.dart';

class SpeechToSpeech extends StatefulWidget {
  const SpeechToSpeech({super.key});

  @override
  State<SpeechToSpeech> createState() => _SpeechToSpeech();
}

class _SpeechToSpeech extends State<SpeechToSpeech> {
  final List<String> languageOptions = ['English', 'Hindi', 'Spanish', 'French', 'German', 'Japanese'];
  String fromLang = 'English';
  String toLang = 'Hindi';

  String inputText = "";
  String outputText = "";

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(5, 65, 5, 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 30),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Speech To Speech Translation",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          )
                        ),
                      ]
                    ),
                    SizedBox(height: 50),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: w*0.35, // Adjust width to your preference
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Add padding
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 180, 180, 180), // Shadow color with opacity
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: Offset(2, 3), // Offset of the shadow
                                ),
                              ],
                            ),
                            child: DropdownButton(
                              isExpanded: true, // Make dropdown take full width
                              value: fromLang,
                              icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                              style: TextStyle(color: Colors.black),
                              underline: SizedBox(), // Remove the default underline
                              onChanged: (String? newval) {
                                setState(() {
                                  fromLang = newval!;
                                });
                              },
                              items: languageOptions.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text(
                            "To",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: w*0.35, // Adjust width to your preference
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Add padding
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 180, 180, 180), // Shadow color with opacity
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: Offset(2, 3), // Offset of the shadow
                                ),
                              ],
                            ),
                            child: DropdownButton(
                              isExpanded: true, // Make dropdown take full width
                              value: toLang,
                              icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                              style: TextStyle(color: Colors.black),
                              underline: SizedBox(), // Remove the default underline
                              onChanged: (String? newval) {
                                setState(() {
                                  toLang = newval!;
                                });
                              },
                              items: languageOptions.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 70),
                    Container(
                      width: w,
                      height: h*0.25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8), // Optional: Make the corners rounded
                        color: Color(0xFFD7FCF6), // Same background color as the input field
                      ),
                      padding: EdgeInsets.all(20), // Padding inside the container
                      child: Row( 
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1)
                              )
                            ),
                            width: w*0.58,
                            height: h*0.35,
                            child: Text(
                              outputText,
                              style: TextStyle(
                                color: Colors.black, // Text color to match the input
                                fontSize: 16, // Font size matching the input field
                                fontWeight: FontWeight.w500, // Optional: Font weight to match input field
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          GestureDetector(
                            child: Icon(Icons.mic, size: 50, color: Colors.blue.shade800)
                          ),
                        ]
                      )
                    ),
                    SizedBox(height: 60),
                    Container(
                      width: w,
                      height: h*0.25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8), // Optional: Make the corners rounded
                        color: Color(0xFFD7FCF6), // Same background color as the input field
                      ),
                      padding: EdgeInsets.all(20), // Padding inside the container
                      child: Row( 
                        children: [
                          GestureDetector(
                            child: Icon(Icons.play_arrow, size: 50, color: Colors.green.shade600)
                          ),
                          SizedBox(width: 15,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(color: Colors.black, width: 1)
                              )
                            ),
                            width: w*0.58,
                            height: h*0.35,
                            child: Text(
                              outputText,
                              style: TextStyle(
                                color: Colors.black, // Text color to match the input
                                fontSize: 16, // Font size matching the input field
                                fontWeight: FontWeight.w500, // Optional: Font weight to match input field
                              ),
                            ),
                          ),
                        ]
                      )
                    ),

                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: h*0.61,
            left: w*0.39,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(Icons.translate, size: 65 , color: Colors.white,)
            )
          )
        ],
      )
    );
  }
}