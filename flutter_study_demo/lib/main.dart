import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterstudydemo/pages/shrine/shrine_home.dart';
import 'package:flutterstudydemo/pages/shrine/shrine_sign.dart';
import 'package:flutterstudydemo/pages/tabs/tabController.dart';
import './pages/shrine/colors.dart';
import './pages/shrine/cut_corners_border.dart';
import './pages/home_page.dart';
import './pages/route_demo/routerTestRoute.dart';
import './pages/route_demo/tip_router_page.dart';
import './pages/product_details.dart';
import './pages/randomwords_list_demo/randomwords_list_page.dart';
import './pages/signup_demo/sign_up_page.dart';
import './pages/chat_demo/friendly_chat_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final ThemeData kIosTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.red[100],
    primaryColorBrightness: Brightness.light,
  );

  final ThemeData kDefaultTheme = ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.orangeAccent[400],
  );

  final ThemeData _kShrineTheme = _buildShrineTheme();
  final ThemeData _kShrineThemeGrey = _buildShrineThemeGrey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes;
    return MaterialApp(
      title: 'Flutter Demo',
//      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIosTheme : kDefaultTheme,
      theme: _kShrineTheme,
//      theme: _kShrineThemeGrey,
      // 注册路由表
      routes: {
        "route_test": (context) =>  RouterTestRoute(),
        "route_test2": (context) =>  TipRoute(),
        "product": (context) => ProductDetails(),
        "randomWords": (context) => RandomWords(),
        "signUpPage": (context) => SignUpPage(),
        "welcome": (context) => WelcomeScreen(),
        "friendlychatPage": (context) => FriendlychatPage(),
        "shrineSign": (context) => ShrineSign(),
        "shrineHome": (context) => ShrineHome(),
        "tabs": (context) => TabsDemo(),
      },
      home: HomePage(),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}

ThemeData _buildShrineThemeGrey() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    accentColor: kShrineAltDarkGrey,
    primaryColor: kShrineAltDarkGrey,
    buttonColor: kShrineAltYellow,
    scaffoldBackgroundColor: kShrineAltDarkGrey,
    cardColor: kShrineAltDarkGrey,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineAltYellow
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineSurfaceWhite,
    bodyColor: kShrineSurfaceWhite,
  );
}