import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
      required this.textFormHint,
      this.isPassword = false,
      required this.textEditingController})
      : super(key: key);

  final String textFormHint;
  final bool isPassword;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: isPassword ? false : true,
      obscureText: isPassword ? true : false,
      controller: textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.grey.shade700, width: 0.7),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.grey.shade700, width: 0.7),
          ),
          hintText: textFormHint,
          hintStyle: const TextStyle(fontFamily: 'avenir')),
    );
  }
}
