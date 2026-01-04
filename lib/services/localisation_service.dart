import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

/// App Localisation service
class LocalizationService {

  /// main localisation function for MaterialApp
  FlutterI18nDelegate get localization => FlutterI18nDelegate(
    translationLoader: NamespaceFileTranslationLoader(
      namespaces: [
        'avatars_screen',
      ],
    ),
    missingTranslationHandler: (key, locale) {
      debugPrint('--- Missing Key: $key, languageCode: ${locale!.languageCode}');
    },
  );
}
