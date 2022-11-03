import 'package:carikerja/ui/themes/colors_ck.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldCk extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;

  const TextFieldCk(
      {Key? key,
      required this.controller,
      this.hintText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.getFont('Roboto', fontSize: 18),
      cursorColor: ColorsCk.secundary,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsCk.primary)),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
