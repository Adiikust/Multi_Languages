import 'package:multi_localizations/Controller/languages_provider.dart';
import 'package:provider/provider.dart';

class AllProviderRegistration {
  static get allProvider => [
        ChangeNotifierProvider<LanguagesProvider>(
            create: (context) => LanguagesProvider()),
      ];
}
