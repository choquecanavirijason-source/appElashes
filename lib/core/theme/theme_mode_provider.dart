import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/prefs_storage.dart';

/// Controla el modo de tema (sistema / claro / oscuro) y lo persiste en prefs.
///
/// Nota: las pantallas actuales del admin están estilizadas para oscuro; por eso
/// el valor por defecto es [ThemeMode.dark] hasta completar el pase de theming
/// claro de cada pantalla.
class ThemeModeController extends Notifier<ThemeMode> {
  static const _key = 'theme_mode';

  @override
  ThemeMode build() {
    final raw = ref.read(prefsStorageProvider).readString(_key);
    return _parse(raw);
  }

  Future<void> set(ThemeMode mode) async {
    state = mode;
    await ref.read(prefsStorageProvider).writeString(_key, mode.name);
  }

  static ThemeMode _parse(String? raw) {
    switch (raw) {
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.dark;
    }
  }
}

final themeModeProvider =
    NotifierProvider<ThemeModeController, ThemeMode>(ThemeModeController.new);
