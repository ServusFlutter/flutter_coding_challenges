import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:coding_challenge_1/src/servus_flutter/l10n/localization_extension.dart';
import 'package:coding_challenge_1/src/servus_flutter/notifier/challenge_tester_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:url_launcher/url_launcher_string.dart';

class ChallengeTester extends ConsumerWidget {
  final GlobalKey challengerWidgetKey;

  const ChallengeTester({
    super.key,
    required this.challengerWidgetKey,
  });

  Future<int> generateWidgetValue() async {
    RenderRepaintBoundary boundary = challengerWidgetKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    ui.Image uiImage = await boundary.toImage();

    ByteData? byteData =
        await uiImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    img.Image image = img.decodeImage(pngBytes)!;
    img.Pixel pixel = image.first;
    int sum = 0;
    do {
      sum +=
          pixel.r.toInt() + pixel.g.toInt() + pixel.b.toInt() + pixel.a.toInt();
    } while (pixel.moveNext());

    // debugPrint("$sum");
    return sum;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(challengeTesterNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Text(context.l10n.testExplanation,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: state.isLoading
              ? null
              : () async {
                  final widgetValue = await generateWidgetValue();
                  ref
                      .read(challengeTesterNotifierProvider.notifier)
                      .testWidget(widgetValue);
                },
          child: switch (state.isLoading) {
            true => const SizedBox(
                height: 16, width: 16, child: CircularProgressIndicator()),
            false => Text(context.l10n.testButton)
          },
        ),
        if (state.hasError)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              context.l10n.testWidgetError,
              textAlign: ui.TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: Colors.red),
            ),
          ),

        // Success State
        if (state.valueOrNull != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Text(
                  context.l10n.testSuccessTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.apply(color: Colors.green),
                ),
                Text(
                  context.l10n.testSuccessExplanation,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(16)),
                  child: SelectableText(
                    state.valueOrNull!.code,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                    onPressed: () {
                      launchUrlString(
                          "https://www.servusflutter.com/challenges");
                    },
                    child: Text(context.l10n.openCodingChallengePageButton))
              ],
            ),
          ),
      ],
    );
  }
}
