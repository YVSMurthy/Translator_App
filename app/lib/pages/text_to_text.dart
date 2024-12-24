import 'package:flutter/material.dart';

class TextToText extends StatefulWidget {
  const TextToText({super.key});

  @override
  State<TextToText> createState() => _TextToText();
}

class _TextToText extends State<TextToText> {
  final List<String> languageOptions = ['English', 'Hindi', 'Spanish', 'French', 'German', 'Japanese'];
  String fromLang = 'English';
  String toLang = 'Hindi';

  String inputText = "";
  String outputText = "";

  void translateText(String s) {
    setState(() {
      outputText = s;
    });
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
                            translateText(value);
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
        items: languageOptions.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
