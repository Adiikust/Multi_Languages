import 'package:flutter/material.dart';
import 'package:multi_localizations/Controller/all_provider_registraction.dart';
import 'package:multi_localizations/Controller/languages_provider.dart';
import 'package:multi_localizations/Screens/home/home_screen.dart';
import 'package:multi_localizations/core/app_constant.dart';
import 'package:multi_localizations/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  final languageCode = pref.getString(AppConstant.getLanguageTypeCode) ?? "";
  runApp(MyApp(
    language: languageCode,
  ));
}

class MyApp extends StatelessWidget {
  final String language;
  const MyApp({super.key, required this.language});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(language);
    return MultiProvider(
      providers: AllProviderRegistration.allProvider,
      child: Consumer<LanguagesProvider>(
        builder: (context, languagesProvider, child) {
          Locale? selectedLocale;
          if (languagesProvider.locale != null) {
            selectedLocale = languagesProvider.locale;
          } else if (language.isNotEmpty) {
            selectedLocale = Locale(language);
          } else {
            selectedLocale = const Locale('en');
          }
          return MaterialApp(
            title: AppConstant.appName,
            locale: selectedLocale,
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
