//packages
import 'package:uuid/uuid.dart';
//titles
const String appTitle = "SNS";
const String signupTitle = "新規登録";
const String loginTitle = "ログイン";
const String cropperTitle = "Cropper";
const String accountTitle = "アカウント";
const String themeTitle = "テーマ";
const String profileTitle = "プロフィール";
//bottom navigation bat
const String homeText = "Home";
const String searchText = "Search";
const String profileText = "profile";
//texts
const String mailAddressText = "メールアドレス";
const String signupText = "新規登録を行う";
const String loginText = "ログインする";
const String passwordText = "パスワード";
const String logoutText = "ログアウトを行う";
const String loadingText = "ローディング中";
const String uploadText = "アップロードする";
//name
const String aliceName = "アリス";
//field key
const String usersFieldKey = "users";
//message
const String userCreatedMsg = "ユーザーが作成できました";
const String noAccountMsg = "アカウントをお持ちでない場合";

//prefs key
const String isDarkThemePrefsKey = "isDarkTheme";

String returnUuidV4() {
  final Uuid uuid = Uuid();
  return uuid.v4();
}

String returnJpgFileName () => "${returnUuidV4()}.jpg";
