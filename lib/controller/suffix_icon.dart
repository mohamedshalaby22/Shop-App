// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuffixController extends GetxController {
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  ChangeIconVisiblity() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    update();
  }
}
