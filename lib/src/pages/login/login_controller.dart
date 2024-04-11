import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginController{
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future? init(BuildContext context){
    this.context = context;
  }

  void goToRegisterPage(){
    Navigator.pushNamed(context!, 'register');
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();


    print('Email: ${email}');
    print('password: ${password}');
  }
}