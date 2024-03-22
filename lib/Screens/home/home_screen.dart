import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multi_localizations/Controller/languages_provider.dart';
import 'package:multi_localizations/Utils/enums/languages_enum.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.multiLocalization),
        actions: [
          Consumer<LanguagesProvider>(
            builder: (context, languagesProvider, child) {
              return PopupMenuButton(
                onSelected: (Languages languages) {
                  if (Languages.english.name == languages.name) {
                    languagesProvider.changeLanguages(const Locale('en'));
                  } else {
                    languagesProvider.changeLanguages(const Locale('es'));
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Languages>>[
                  PopupMenuItem(
                    value: Languages.english,
                    child: Text(AppLocalizations.of(context)!.english),
                  ),
                  PopupMenuItem(
                    value: Languages.spanish,
                    child: Text(AppLocalizations.of(context)!.spanish),
                  ),
                ],
              );
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.whatIsFlutter),
              Text(AppLocalizations.of(context)!.flutterOpenSource),
            ],
          ),
        ),
      ),
    );
  }
}
