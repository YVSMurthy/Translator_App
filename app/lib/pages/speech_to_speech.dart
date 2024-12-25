import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class SpeechToSpeech extends StatefulWidget {
  const SpeechToSpeech({super.key});

  @override
  State<SpeechToSpeech> createState() => _SpeechToSpeech();
}

class _SpeechToSpeech extends State<SpeechToSpeech> {
  List<DropdownMenuItem<String>> languageOptions = [
    DropdownMenuItem(value: 'af', child: Text('Afrikaans')),
    DropdownMenuItem(value: 'sq', child: Text('Albanian')),
    DropdownMenuItem(value: 'ar', child: Text('Arabic')),
    DropdownMenuItem(value: 'az', child: Text('Azerbaijani')),
    DropdownMenuItem(value: 'eu', child: Text('Basque')),
    DropdownMenuItem(value: 'be', child: Text('Belarusian')),
    DropdownMenuItem(value: 'bn', child: Text('Bengali')),
    DropdownMenuItem(value: 'bs', child: Text('Bosnian')),
    DropdownMenuItem(value: 'bg', child: Text('Bulgarian')),
    DropdownMenuItem(value: 'ca', child: Text('Catalan')),
    DropdownMenuItem(value: 'zh', child: Text('Chinese (Simplified)')),
    DropdownMenuItem(value: 'hr', child: Text('Croatian')),
    DropdownMenuItem(value: 'cs', child: Text('Czech')),
    DropdownMenuItem(value: 'da', child: Text('Danish')),
    DropdownMenuItem(value: 'nl', child: Text('Dutch')),
    DropdownMenuItem(value: 'en', child: Text('English')),
    DropdownMenuItem(value: 'eo', child: Text('Esperanto')),
    DropdownMenuItem(value: 'et', child: Text('Estonian')),
    DropdownMenuItem(value: 'fi', child: Text('Finnish')),
    DropdownMenuItem(value: 'fr', child: Text('French')),
    DropdownMenuItem(value: 'gl', child: Text('Galician')),
    DropdownMenuItem(value: 'ka', child: Text('Georgian')),
    DropdownMenuItem(value: 'de', child: Text('German')),
    DropdownMenuItem(value: 'el', child: Text('Greek')),
    DropdownMenuItem(value: 'he', child: Text('Hebrew')),
    DropdownMenuItem(value: 'hi', child: Text('Hindi')),
    DropdownMenuItem(value: 'hu', child: Text('Hungarian')),
    DropdownMenuItem(value: 'is', child: Text('Icelandic')),
    DropdownMenuItem(value: 'id', child: Text('Indonesian')),
    DropdownMenuItem(value: 'ga', child: Text('Irish')),
    DropdownMenuItem(value: 'it', child: Text('Italian')),
    DropdownMenuItem(value: 'ja', child: Text('Japanese')),
    DropdownMenuItem(value: 'kk', child: Text('Kazakh')),
    DropdownMenuItem(value: 'ko', child: Text('Korean')),
    DropdownMenuItem(value: 'la', child: Text('Latin')),
    DropdownMenuItem(value: 'lv', child: Text('Latvian')),
    DropdownMenuItem(value: 'lt', child: Text('Lithuanian')),
    DropdownMenuItem(value: 'mk', child: Text('Macedonian')),
    DropdownMenuItem(value: 'ms', child: Text('Malay')),
    DropdownMenuItem(value: 'mt', child: Text('Maltese')),
    DropdownMenuItem(value: 'no', child: Text('Norwegian')),
    DropdownMenuItem(value: 'fa', child: Text('Persian')),
    DropdownMenuItem(value: 'pl', child: Text('Polish')),
    DropdownMenuItem(value: 'pt', child: Text('Portuguese')),
    DropdownMenuItem(value: 'ro', child: Text('Romanian')),
    DropdownMenuItem(value: 'ru', child: Text('Russian')),
    DropdownMenuItem(value: 'sr', child: Text('Serbian')),
    DropdownMenuItem(value: 'sk', child: Text('Slovak')),
    DropdownMenuItem(value: 'sl', child: Text('Slovenian')),
    DropdownMenuItem(value: 'es', child: Text('Spanish')),
    DropdownMenuItem(value: 'sw', child: Text('Swahili')),
    DropdownMenuItem(value: 'sv', child: Text('Swedish')),
    DropdownMenuItem(value: 'th', child: Text('Thai')),
    DropdownMenuItem(value: 'tr', child: Text('Turkish')),
    DropdownMenuItem(value: 'uk', child: Text('Ukrainian')),
    DropdownMenuItem(value: 'ur', child: Text('Urdu')),
    DropdownMenuItem(value: 'vi', child: Text('Vietnamese')),
    DropdownMenuItem(value: 'cy', child: Text('Welsh')),
  ];
  
  String fromLang = 'en';
  String toLang = 'hi';

  String inputText = "";
  String outputText = "";
  bool isListening = false;

  late stt.SpeechToText _speech; // Speech-to-text instance
  late FlutterTts _flutterTts; // Text-to-speech instance


  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _flutterTts = FlutterTts();
  }

  Future<void> getSpeechToText() async {
    if (isListening) {
      setState(() {
        isListening = false;
      });
      _speech.stop();
      translateText(inputText, fromLang, toLang);
    } else {
      bool available = await _speech.initialize();
      setState(() {
        inputText = "";
        outputText = "";
      });
      if (available) {
        setState(() {
          isListening = true;
        });
        _speech.listen(onResult: (result) {
          setState(() {
            inputText = result.recognizedWords;
            print(result.recognizedWords);
          });
        });
      }
    }
  }

  // Function to convert text to speech
  Future<void> getTextToSpeech(String text) async {
    Map<String, String> languageToVoiceMap = {
      'af': 'af-ZA', // Afrikaans
      'sq': 'sq-AL', // Albanian
      'ar': 'ar-SA', // Arabic (Saudi Arabia)
      'az': 'az-AZ', // Azerbaijani
      'eu': 'eu-ES', // Basque
      'be': 'be-BY', // Belarusian
      'bn': 'bn-IN', // Bengali (India)
      'bs': 'bs-BA', // Bosnian
      'bg': 'bg-BG', // Bulgarian
      'ca': 'ca-ES', // Catalan
      'zh': 'zh-CN', // Chinese (Simplified)
      'hr': 'hr-HR', // Croatian
      'cs': 'cs-CZ', // Czech
      'da': 'da-DK', // Danish
      'nl': 'nl-NL', // Dutch
      'en': 'en-US', // English (US)
      'eo': 'eo-EO', // Esperanto
      'et': 'et-EE', // Estonian
      'fi': 'fi-FI', // Finnish
      'fr': 'fr-FR', // French
      'gl': 'gl-ES', // Galician
      'ka': 'ka-GE', // Georgian
      'de': 'de-DE', // German
      'el': 'el-GR', // Greek
      'he': 'he-IL', // Hebrew
      'hi': 'hi-IN', // Hindi (India)
      'hu': 'hu-HU', // Hungarian
      'is': 'is-IS', // Icelandic
      'id': 'id-ID', // Indonesian
      'ga': 'ga-IE', // Irish
      'it': 'it-IT', // Italian
      'ja': 'ja-JP', // Japanese
      'kk': 'kk-KZ', // Kazakh
      'ko': 'ko-KR', // Korean
      'la': 'la-VA', // Latin (Vatican)
      'lv': 'lv-LV', // Latvian
      'lt': 'lt-LT', // Lithuanian
      'mk': 'mk-MK', // Macedonian
      'ms': 'ms-MY', // Malay (Malaysia)
      'mt': 'mt-MT', // Maltese
      'no': 'no-NO', // Norwegian
      'fa': 'fa-IR', // Persian (Iran)
      'pl': 'pl-PL', // Polish
      'pt': 'pt-BR', // Portuguese (Brazil)
      'ro': 'ro-RO', // Romanian
      'ru': 'ru-RU', // Russian
      'sr': 'sr-RS', // Serbian
      'sk': 'sk-SK', // Slovak
      'sl': 'sl-SI', // Slovenian
      'es': 'es-MX', // Spanish (Mexico)
      'sw': 'sw-KE', // Swahili
      'sv': 'sv-SE', // Swedish
      'th': 'th-TH', // Thai
      'tr': 'tr-TR', // Turkish
      'uk': 'uk-UA', // Ukrainian
      'ur': 'ur-PK', // Urdu (Pakistan)
      'vi': 'vi-VN', // Vietnamese
      'cy': 'cy-GB', // Welsh
    };

    String? language = languageToVoiceMap[toLang];

    await _flutterTts.setLanguage(language!); // Simplified language mapping
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);

  }

  // Function to simulate translation (you can replace this with actual logic)
  Future<void> translateText(String text, String sourceLang, String targetLang) async {
    String apiUri = 'https://libretranslate.com/translate';

    try {
      // final response = await http.post(
      //   Uri.parse(apiUri),
      //   headers: {"Content-Type": "application/json"},
      //   body: jsonEncode({
      //     "q": text,
      //     "source": sourceLang,
      //     "target": targetLang,
      //     "format": "text",
      //     "alternatives": 3,
      //     "api": "", // Ensure you're passing correct params as per API documentation
      //   }),
      // );

      // print('Response Status: ${response.statusCode}');
      // print('Response Body: ${response.body}');

      // if (response.statusCode == 200) {
      //   final Map<String, dynamic> data = jsonDecode(response.body);
      //   print('Translated Text: ${data["translatedText"]}');
      //   setState(() {
      //     outputText = "Output text is :: " + data["translatedText"];
      //   });
      // } else {
      //   setState(() {
      //     outputText = "Error: ${response.statusCode}";
      //   });
      // }
      setState(() {
        outputText = "Hola. ¿Cómo estás?";
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        outputText = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
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
                        items: languageOptions,
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
                        items: languageOptions,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 70),

              Stack(
                children: [
                  Column(
                    children: [
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
                              padding: EdgeInsets.all(15),
                              child: Text(
                                inputText,
                                style: TextStyle(
                                  color: Colors.black, // Text color to match the input
                                  fontSize: 16, // Font size matching the input field
                                  fontWeight: FontWeight.w500, // Optional: Font weight to match input field
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            IconButton(
                              icon: Icon(Icons.mic, color: isListening ? Colors.red : Colors.blue, size: 40),
                              onPressed: getSpeechToText,
                            ),
                          ]
                        )
                      ),
                      SizedBox(height: 40),
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
                            IconButton(
                              icon: Icon(Icons.play_arrow, color: Colors.green.shade600, size: 40),
                              onPressed: () {
                                getTextToSpeech(outputText);
                              },
                            ),
                            SizedBox(width: 10,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.black, width: 1)
                                )
                              ),
                              width: w*0.58,
                              height: h*0.35,
                              padding: EdgeInsets.all(15),
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
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Icon(Icons.translate, size: 65, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}