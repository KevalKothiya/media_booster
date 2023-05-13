import 'package:flutter/material.dart';
import 'package:media_booster/controller/controller_provider.dart';
import 'package:media_booster/home_page.dart';
import 'package:media_booster/model/utils.dart';
import 'package:media_booster/screens/videoPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoStopPlayButton_Provider(),),
        ChangeNotifierProvider(create: (context) => AudioStopPlayButton_Provider(),),
        ChangeNotifierProvider(create: (context) => Audio_Provider(),),
        ChangeNotifierProvider(create: (context) => Global_Providre(),),
        ChangeNotifierProvider(create: (context) => Video_Provider(),),
        ChangeNotifierProvider(create: (context) => VideoList_Provider(),),
      ],
      builder: (context, _) {
        return Sizer(
          builder: (context, _, __) {
            return MaterialApp(
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: ThemeMode.dark,
              routes: {
                '/': (context) => HomePage(),
                'VideoPageDetails': (context) => VideoPageDetails(),
              },
            );
          },
        );
      },
    ),
  );
}
