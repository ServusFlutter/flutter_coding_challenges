import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_tester_notifier.g.dart';

@Riverpod(dependencies: [])
class ChallengeTesterNotifier extends _$ChallengeTesterNotifier {
  Future<void> testWidget(int widgetValue) async {
    state = const AsyncLoading();

    // Artificial delay just to rate-limit all requests
    await Future.delayed(const Duration(seconds: 1));
    String url =
        "https://servusflutter.web.app/coding-challenges/1/web/$widgetValue.json";
    try {
      final response = await Dio().get<String>(url);
      if (response.data == null) {
        return;
      }
      final body = jsonDecode(response.data!);
      final code = body["code"];
      state = AsyncValue.data(ChallengeTesterSuccessState(code: code));
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  @override
  Future<ChallengeTesterSuccessState?> build() async {
    return null;
  }
}

class ChallengeTesterSuccessState {
  final String code;

  ChallengeTesterSuccessState({required this.code});
}
