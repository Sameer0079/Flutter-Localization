# Localization in Flutter

1. Add Packages
    1. ``` flutter pub add flutter_localizations --sdk=flutter``` 
    2. ``` flutter pub add intl:any``` 
2. add this line in pub.yaml
    ``` flutter:``` 
        ``` generate: true``` 
3. create "l10n" folder under lib folder and create app_en.arb bundle file
4. create l10n.yaml file and add below code
    ``` arb-dir: lib/l10n``` 
    ``` template-arb-file: app_en.arb``` 
    ``` output-lozalization-file: app_l10n.dart``` 
5. run ``` "flutter gen-l10n" ```   command in terminal
6. create "app_localizations.dart" file under l10n folder and add below line
    ``` export 'package:flutter_gen/gen_l10n/app_localizations.dart'; ``` 
7. Add below line in MaterialApp
        ``` localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,``` 

Now you can access the Locale value with AppLocations.of(context).variableName
also you need to change locale parameter in MaterialApp to change the language
