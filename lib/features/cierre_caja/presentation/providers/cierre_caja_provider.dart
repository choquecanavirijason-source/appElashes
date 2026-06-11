import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/daily_closing_repository_impl.dart';

final selectedClosingDateProvider = StateProvider.autoDispose<DateTime>(
  (ref) => DateTime.now(),
);

final dailyClosingProvider =
    FutureProvider.autoDispose.family<DailyClosing, String>((ref, date) {
  return ref
      .read(dailyClosingRepositoryProvider)
      .getClosing(date: date);
});
