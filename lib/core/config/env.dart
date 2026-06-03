import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Env._();

  static Future<void> load() async {
    await dotenv.load();
  }

  static String get apiBaseUrl {
    final fromEnv = dotenv.maybeGet('API_BASE_URL');
    if (fromEnv != null && fromEnv.isNotEmpty) return fromEnv;
    if (kIsWeb) return 'http://localhost:8000';
    if (Platform.isAndroid) return 'http://10.0.2.2:8000';
    return 'http://localhost:8000';
  }

  static Duration get connectTimeout =>
      _durationFromEnv('API_CONNECT_TIMEOUT_MS', defaultMs: 15000);
  static Duration get receiveTimeout =>
      _durationFromEnv('API_RECEIVE_TIMEOUT_MS', defaultMs: 20000);
  static Duration get sendTimeout =>
      _durationFromEnv('API_SEND_TIMEOUT_MS', defaultMs: 20000);

  static bool get isDevelopment {
    final raw = dotenv.maybeGet('APP_ENV')?.toLowerCase() ?? 'development';
    return raw != 'production';
  }

  static const String tokenStorageKey = '_tkn';
  static const String selectedBranchPrefsKey = 'selected_branch_id';
  static const String locale = 'es_BO';
  static const String currencyCode = 'BOB';
  static const String currencySymbol = 'Bs';

  static Duration _durationFromEnv(String key, {required int defaultMs}) {
    final raw = dotenv.maybeGet(key);
    final ms = int.tryParse(raw ?? '') ?? defaultMs;
    return Duration(milliseconds: ms);
  }
}
