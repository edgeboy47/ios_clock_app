import 'package:bloc_test/bloc_test.dart';
import 'package:clock_app/world_clock/bloc/world_clock_bloc.dart';
import 'package:clock_app/world_clock/world_clock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorldClockBloc', () {
    late WorldClockBloc worldClockBloc;
    late WorldClock worldClock;
    late DateTime testDateTime;

    setUp(() {
      worldClock = const WorldClock();
      worldClockBloc = WorldClockBloc(worldClock);
      testDateTime = DateTime.now();
    });

    test('Initial state is WorldStateInitial', () {
      expect(worldClockBloc.state, isA<WorldClockInitial>());
    });

    test('Initial state dateTime is within 100ms of current DateTime', () {
      expect(
          worldClockBloc.state.dateTime.difference(testDateTime).abs() <=
              const Duration(milliseconds: 100),
          isTrue);
    });

    blocTest<WorldClockBloc, WorldClockState>(
      'Bloc is emitting a new WorldClockRunning state every second',
      build: () {
        return WorldClockBloc(const WorldClock());
      },
      wait: const Duration(seconds: 5),
      expect: () => [
        isA<WorldClockRunning>(),
        isA<WorldClockRunning>(),
        isA<WorldClockRunning>(),
        isA<WorldClockRunning>(),
        isA<WorldClockRunning>(),
      ],
    );
  });
}
