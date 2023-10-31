//flutter
import 'package:flutter/material.dart';

//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/details/rounded_password_field.dart';

// model
import '../models/main_model.dart';
import '../models/signup_model.dart';

//components
import 'package:flutter_udemy_sns/details/rounded_text_field.dart';
import 'package:flutter_udemy_sns/details/rounded_password_field.dart';
import 'package:flutter_udemy_sns/details/rounded_button.dart';

//constans
import 'package:flutter_udemy_sns/constants/strings.dart';

class SignupPage extends ConsumerWidget{
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final SignupModel signupModel = ref.watch(signupProvider);
    final TextEditingController emailEditingController = TextEditingController(text: signupModel.email);
    final TextEditingController passwordEditingController = TextEditingController(text: signupModel.password);
    return Scaffold(
      appBar: AppBar(
        title: Text(signupTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            keybordType: TextInputType.emailAddress,
            controller: emailEditingController,
            onChanged: (text) => signupModel.email = text,
            color: Colors.white,
            borederColor: Colors.black,
            shadowColor: Colors.orange,
            hintText: mailAddressText,
          ),
          RoundedPasswordField(
              onChanged: (text) => signupModel.password = text,
              passwordEditingController: passwordEditingController,
              obuscureText: signupModel.isObscure,
              toggleObscureText: signupModel.toggleIsObsucure,
              color: Colors.white,
              shadowColor: Colors.orange,
              borderColor: Colors.black
          ),
          RoundedButton(
            onPressed: () async => await signupModel.createUser(context: context),
            widthRate: 0.85,
            color: Colors.red,
            text: signupText,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await signupModel.createUser(context: context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}