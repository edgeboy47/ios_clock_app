import 'dart:async';

import 'package:clock_app/world_clock/world_clock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late WorldClock worldClock;
  late StreamSubscription streamSubscription;

  setUp(() {
    worldClock = const WorldClock();
    streamSubscription = worldClock.currentLocalTime.take(1).listen((_) {});
  });

  tearDown(() {
    streamSubscription.cancel();
  });

  test('Stream emits DateTime within 100ms of current time', () async {
    final streamTime = await worldClock.currentLocalTime.first;
    final currentTime = DateTime.now();

    expect(
        streamTime.difference(currentTime).abs() <=
            const Duration(milliseconds: 100),
        isTrue);
  });

  test('Stream emits a DateTime object', () {
    expectLater(worldClock.currentLocalTime, emits(isA<DateTime>()));
  });
}
