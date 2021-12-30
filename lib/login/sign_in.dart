// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/suffix_icon.dart';

import 'package:flutter_application_1/login/sign_up.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/view/componements.dart';
import 'package:flutter_application_1/view/home_screen.dart';

import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var formKey = GlobalKey<FormState>();

  var email = TextEditingController();

  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuffixController>(
      init: SuffixController(),
      builder: (value) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome,',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                      height: 220,
                      child: Image(image: AssetImage('assets/login.png'))),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFormField(
                      controller: email,
                      type: TextInputType.emailAddress,
                      text: 'Email',
                      icon: Icons.email),
                  const SizedBox(
                    height: 22,
                  ),
                  defaultTextFormField(
                      controller: password,
                      type: TextInputType.visiblePassword,
                      text: 'Password',
                      suffix: value.suffix,
                      isPassword: value.isPassword,
                      suffixpress: () {
                        value.ChangeIconVisiblity();
                      },
                      icon: Icons.lock),
                  const SizedBox(
                    height: 22,
                  ),
                  defaultMaterialButton(
                      text: 'SIGN IN',
                      pressed: () {
                        if (formKey.currentState!.validate()) {
                          var result =
                              authController.login(email.text, password.text);
                          if (result) {
                            Get.offAll(HomeView());
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Successfully logged in."),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Invalid login credentials."),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Invalid username or password."),
                            ),
                          );
                        }
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Color(0xff75757D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(SignUp());
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
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
      ),
    );
  }
}
