import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;

import 'package:coding_challenge_1/start_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

class ServusFlutterMain extends StatefulWidget {
  const ServusFlutterMain({super.key});

  @override
  State<ServusFlutterMain> createState() => _ServusFlutterMainState();
}

class _ServusFlutterMainState extends State<ServusFlutterMain> {
  final GlobalKey challengeKey = GlobalKey();

  bool loading = false;
  String? successCode;
  String? error;

  Future<void> testWidget(int widgetValue) async {
    setState(() {
      error = null;
      loading = true;
    });
    print("testing with $widgetValue");
    try {
      await Future.delayed(const Duration(seconds: 1));
      String url = "https://servusflutter.web.app/coding-challenges/1/web/$widgetValue.json";
      print(url);
      final response = await Dio().get<String>(url);
      print(response.statusCode);
      print(response.data);
      if (response.data == null) {
        return;
      }
      final body = jsonDecode(response.data!);

      final code = body["code"];
      setState(() {
        successCode = code;
      });
      return;
    } catch (e) {
      // do nothing
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
    }
    setState(() {
      error = "Sorry, not correct.";
    });
    return;
  }

  Future<void> generateWidgetValue() async {
    RenderRepaintBoundary boundary = challengeKey.currentContext!
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

    await testWidget(sum);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Coding Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: SizedBox(
                  height: 350,
                  width: 350,
                  child: RepaintBoundary(
                    key: challengeKey,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                        child: const StartWidget()),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await generateWidgetValue();
                },
                child: switch (loading) {
                  true => const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator()),
                  false => const Text("Test Solution")
                },
              ),
              if (error != null)
                Text(error!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.apply(color: Colors.red)),
              if (successCode != null) ...[
                Text(
                  "Success!!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.apply(color: Colors.green),
                ),
                Text(
                  "This is the Coding Challenge code. Submit it as the answer!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(16)),
                  child: SelectableText(successCode!),
                )
              ]
            ],
          )),
        ),
      ),
    );
  }
}
