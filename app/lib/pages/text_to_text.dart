import 'package:flutter/material.dart';

class TextToText extends StatefulWidget {
  const TextToText({super.key});

  @override
  State<TextToText> createState() => _TextToText();
}

class _TextToText extends State<TextToText> {
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
        outputText = text;
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
      body: SingleChildScrollView(
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
                      "Text To Text Translation",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildLanguageDropdown(fromLang, (newVal) {
                      setState(() => fromLang = newVal!);
                    }),
                    SizedBox(width: 20),
                    Text(
                      "To",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 20),
                    _buildLanguageDropdown(toLang, (newVal) {
                      setState(() => toLang = newVal!);
                    }),
                  ],
                ),
                SizedBox(height: 70),
                Stack(
                  children: [
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Type the text to be translated...',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                            filled: true,
                            fillColor: Color(0xFFD7FCF6),
                          ),
                          textInputAction: TextInputAction.done,
                          maxLines: null,
                          minLines: 6,
                          onChanged: (value) {
                            setState(() {
                              inputText = value;
                            });
                            translateText(inputText, fromLang, toLang);
                          },
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: w,
                          height: h*0.26,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFFD7FCF6),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                          child: Text(
                            outputText,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown(String currentValue, ValueChanged<String?> onChanged) {
    final double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.35,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 180, 180, 180),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: DropdownButton(
        isExpanded: true,
        value: currentValue,
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
        style: TextStyle(color: Colors.black),
        underline: SizedBox(),
        onChanged: onChanged,
        items: languageOptions
      ),
    );
  }
}
