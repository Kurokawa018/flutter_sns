//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//pages
import 'package:flutter_udemy_sns/main.dart';
import 'package:flutter_udemy_sns/models/main_model.dart';
import 'package:flutter_udemy_sns/views/account_page.dart';
import 'package:flutter_udemy_sns/views/signup_page.dart';
import 'package:flutter_udemy_sns/views/login_page.dart';

void toSignupPage({ required BuildContext context}) => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));


void toMyApp({ required BuildContext context}) => Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));

void toLoginPage({ required BuildContext context}) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

void toAccountPage({required BuildContext context,required MainModel mainModel}) => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage(mainModel: mainModel,)));