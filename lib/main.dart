// flutter
import 'package:flutter/material.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_udemy_sns/details/rounded_button.dart';
import 'package:flutter_udemy_sns/details/sns_bottom_navigation_bar.dart';
import 'package:flutter_udemy_sns/details/sns_drawer.dart';
import 'package:flutter_udemy_sns/models/themes_model.dart';
import 'package:flutter_udemy_sns/views/login_page.dart';
import 'package:flutter_udemy_sns/views/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// model
import 'constants/themes.dart';
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

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //MyAppが起動した最初の時にユーザーがログインしてるかの確認
    //この変数は1回きりのみ扱う
    final User? onceUser = FirebaseAuth.instance.currentUser;
    final ThemeModel themeModel = ref.watch(themeProvider);

    print("===============loading===============");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: themeModel.isDarkTheme ?
        darkThemeData(context: context) : lightThemeData(context: context),
      home: onceUser == null ?
          LoginPage() :
          MyHomePage(title: appTitle, themeModel: themeModel,),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title, required this.themeModel}) : super(key: key);
  final String title;
  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Start Execution Main Model");
    final MainModel mainModel = ref.watch(mainProvider);
    print("Ending Execution Main Model");
    final SnsBottomNavigationBarModel snsBottomNavigationBarModel = ref.watch(snsBottomNavigationBarProvider);


    //mainモデルが起動し、initが実行される
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer:SNSDrawer(mainModel: mainModel,themeModel: themeModel,),
      body: mainModel.isLoading ?
          Center(
            child: const Text(loadingText),
          ) :

         PageView(
           controller: snsBottomNavigationBarModel.pageController,
           onPageChanged: (index) => snsBottomNavigationBarModel.onPageChange(index: index),
           children: [
             HomeScreen(),
             SearchScreen(mainModel: mainModel,),
             ProfileScreen(
               mainModel: mainModel,
             ),
           ],
         ),
      bottomNavigationBar: SNSBottomNavigationBar(snsBottomNavigationBarModel: snsBottomNavigationBarModel,),
    );
  }
}