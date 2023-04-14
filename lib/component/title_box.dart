import 'package:couple_date_app/component/font.dart';
import 'package:couple_date_app/component/textField.dart';
import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  final String type;
  final String text;
  final String imageUrl;
  final double imageHeight;
  final VoidCallback? onPressed;
  final ValueChanged<String>? onChanged;
  const TitleBox(
      {required this.type,
      required this.text,
      required this.imageUrl,
      required this.imageHeight,
      this.onPressed,
      this.onChanged,
      Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(imageUrl),
            Container(
              height: imageHeight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: type == 'text'
                      ? [
                          Text(
                            text,
                            style: mysen_small_black),
                        ]
                      : type == 'button'
                          ? [
                              TextButton(
                                onPressed: onPressed,
                                child: Text(
                                  text,
                                  style: mysen_small_black,
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
                                    child: TextFieldComponent(text: text, onChanged: onChanged,),
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
