import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

// ignore: must_be_immutable
class SampleTextField extends StatefulWidget {
  TextEditingController textController;
  String labelText;
  bool hideText;
  String hintText;
  SampleTextField({Key? key, required this.textController, required this.labelText, required this.hideText, required this.hintText}) : super(key: key);

  @override
  State<SampleTextField> createState() => _SampleTextFieldState();
}

class _SampleTextFieldState extends State<SampleTextField> {
  String textControllerText = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        obscureText: widget.hideText,
        controller: widget.textController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: const OutlineInputBorder(),
            labelText: widget.labelText,
            labelStyle: drawerTextColor,

          ),
        style: drawerTextColor,
        keyboardType: TextInputType.text,
        onSubmitted: (text) => {
          setState(() {
            textControllerText = widget.textController.text;
          }
          )
        }
      ),
    );
  }
}
