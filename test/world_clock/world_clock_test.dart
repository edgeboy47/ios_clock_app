import 'package:clock_app/world_clock/world_clock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late WorldClock worldClock;

  setUp(() {
    worldClock = const WorldClock();
  });

  test('Current Time', () async {
    final currentTime = await worldClock.currentLocalTime.first;
    final currentTime2 = DateTime.now();

    expect(currentTime.second, currentTime2.second);
  });
}
