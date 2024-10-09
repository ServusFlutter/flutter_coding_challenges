import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/servus_flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CodingChallengeApp extends StatelessWidget {
  final Widget child;

  const CodingChallengeApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Coding Challenge',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
