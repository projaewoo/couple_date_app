import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  final String type;
  final String text;
  final String imageUrl;
  final double imageHeight;
  final VoidCallback onPressed;
  const TitleBox(
      {required this.type,
      required this.text,
      required this.imageUrl,
      required this.imageHeight,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              child: Image.asset(imageUrl),
            ),
            Container(
              height: imageHeight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: type == 'text'
                      ? [
                          Text(
                            text,
                            style: TextStyle(
                                fontFamily: 'mysen',
                                fontSize: 30,
                                color: Colors.black),
                          ),
                        ]
                      : type == 'button'
                          ? [
                              TextButton(
                                onPressed: onPressed,
                                child: Text(
                                  text,
                                  style: TextStyle(
                                      fontFamily: 'mysen', fontSize: 30),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.black,
                                ),
                              )
                            ]
                          : type == 'textField'
                              ? [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 70,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: text,
                                        hintStyle: TextStyle(
                                          fontFamily: 'mysen',
                                          fontSize: 30,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                      ),
                                      onTap: () {
                                        print('!!');
                                      },
                                    ),
                                  ),
                                ]
                              : []),
            ),
          ],
        ),
      ],
    );
  }
}
