import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/servus_flutter_localizations.dart';

extension AppLocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
