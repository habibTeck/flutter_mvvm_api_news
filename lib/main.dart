import 'package:flutter_mvvm_api_news/view/others/constant.dart';
import 'package:flutter_mvvm_api_news/view/others/routes.dart';
import 'package:flutter_mvvm_api_news/view_model/theme/dark_theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'view/others/them_data.dart';
import 'view/screens/news/news_screen.dart';
import 'view_model/news/news_view_model.dart';

void main(List<String> args) async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => MaterialClassicHeader(
        color: KPrimaryColor,
        backgroundColor: KPrimaryColor,
      ),
      footerBuilder: () => const ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: true,
      shouldFooterFollowWhenNotFull: (status) {
        // If you want load more with noMoreDate state , may be you should return false

        return false;
      },
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => NewsViewModel()..fetchNews(),
            ),
            ChangeNotifierProvider(
              create: (_) {
                return themeChangeProvider;
              },
            ),
          ],
          child: Consumer<DarkThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'NEWS_MVVM_API',
                // Arabic RTL
                localizationsDelegates: const [
                  // to localize it to arabic
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale("ar", "AE"),
                  Locale("en", "EN")
                ],
                // locale: const Locale("en", "EN"),
                //    locale: const Locale("en", "EN"), if you want it to only on local for example if arabic make it  Locale("ar", "AE"),
                theme: Styles.themeData(themeProvider.getDarkTheme, context),
                routes: routes,
                initialRoute: NewsScreen.routeName,
              );
            },
          )),
    );
  }
}
