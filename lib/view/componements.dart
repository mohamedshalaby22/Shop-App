import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String text,
  required IconData icon,
  IconData? suffix,
  Function? suffixpress,
  bool isPassword = false,
}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        }
      },
      style: const TextStyle(
        color: Colors.black,
      ),
      keyboardType: type,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff75757D)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xff75757D))),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            suffixpress!();
          },
          icon: Icon(suffix),
          color: const Color(0xff75757D),
        ),
      ),
    );

Widget defaultMaterialButton({
  double width = 320,
  double height = 60,
  required String text,
  required Function? pressed,
}) =>
    Center(
      child: SizedBox(
        width: width,
        height: height,
        child: MaterialButton(
          color: const Color(0xff75757D),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            pressed!();
          },
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );

final kcPrimaryColor = Color(0xFF1BA739);

