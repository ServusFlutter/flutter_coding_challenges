import 'package:coding_challenge_1/src/servus_flutter/l10n/localization_extension.dart';
import 'package:flutter/material.dart';

class ChallengeExplanation extends StatelessWidget {
  const ChallengeExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          context.l10n.welcomeHeadline,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(context.l10n.welcomeExplanation1,
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 4),
        Text(context.l10n.welcomeExplanation2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
