//flutter
import 'package:flutter/material.dart';

//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/details/rounded_text_field.dart';

// model
import '../models/main_model.dart';
import '../models/login_models.dart';

//components
import 'package:flutter_udemy_sns/details/rounded_text_field.dart';
import 'package:flutter_udemy_sns/details/rounded_password_field.dart';
import 'package:flutter_udemy_sns/details/rounded_button.dart';

//constans
import 'package:flutter_udemy_sns/constants/strings.dart';
import 'package:flutter_udemy_sns/constants/routes.dart' as routes;

class LoginPage extends ConsumerWidget{
  const LoginPage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingController = TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingController = TextEditingController(text: loginModel.password);

    return Scaffold(
      appBar: AppBar(
        title: Text(loginTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
              keybordType: TextInputType.emailAddress,
              onChanged: (text) => loginModel.email = text,
              controller: emailEditingController,
              color: Colors.white,
              borederColor: Colors.black,
              shadowColor: Colors.red,
              hintText: mailAddressText,
          ),
          RoundedPasswordField(
              onChanged: (text) => loginModel.password = text,
              passwordEditingController: passwordEditingController,
              obuscureText: loginModel.isObscure,
              toggleObscureText: loginModel.toggleIsObsucure,
              color: Colors.white,
              shadowColor: Colors.blue,
              borderColor: Colors.black
          ),
          RoundedButton(
            onPressed: () async => await loginModel.login(context: context),
            widthRate: 0.85,
            color: Colors.green,
            text: loginText,
          ),
          TextButton(
              onPressed: () => routes.toSignupPage(context: context),
              child: const Text(noAccountMsg)
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await loginModel.login(context: context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}