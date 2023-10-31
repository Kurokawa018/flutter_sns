// flutter
import 'package:flutter/material.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_udemy_sns/details/rounded_button.dart';
import 'package:flutter_udemy_sns/details/sns_bottom_navigation_bar.dart';
import 'package:flutter_udemy_sns/views/login_page.dart';
import 'package:flutter_udemy_sns/views/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// model
import 'models/main_model.dart';
import 'models/sns_bottom_navigation_bar_model.dart';
// options
import 'firebase_options.dart';
//constants
import 'package:flutter_udemy_sns/constants/routes.dart' as routes;
import 'package:flutter_udemy_sns/constants/strings.dart';
//components
import 'package:flutter_udemy_sns/views/main/home_screen.dart';
import 'package:flutter_udemy_sns/views/main/search_screen.dart';
import 'package:flutter_udemy_sns/views/main/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MyAppが起動した最初の時にユーザーがログインしてるかの確認
    //この変数は1回きりのみ扱う
    final User? onceUser = FirebaseAuth.instance.currentUser;
    print("===============loading===============");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onceUser == null ?
          LoginPage() :
          MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("===============loading2===============");
    final MainModel mainModel = ref.watch(mainProvider);
    print("===============loading5===============");
    final SnsBottomNavigationBarModel snsBottomNavigationBarModel = ref.watch(snsBottomNavigationBarProvider);
    print("===============loading4===============");

    //mainモデルが起動し、initが実行される
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainModel.isLoading ?
          Center(
            child: const Text(loadingText),
          ) :

         PageView(
           controller: snsBottomNavigationBarModel.pageController,
           onPageChanged: (index) => snsBottomNavigationBarModel.onPageChange(index: index),
           children: [
             HomeScreen(),
             SearchScreen(),
             ProfileScreen(
               mainModel: mainModel,
             ),
           ],
         ),
      bottomNavigationBar: SNSBottomNavigationBar(snsBottomNavigationBarModel: snsBottomNavigationBarModel,),
    );
  }
}