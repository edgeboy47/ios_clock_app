import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clock_app/world_clock/world_clock.dart';
import 'package:equatable/equatable.dart';

part 'world_clock_event.dart';
part 'world_clock_state.dart';

class WorldClockBloc extends Bloc<WorldClockEvent, WorldClockState> {
  WorldClockBloc(this._worldClock) : super(WorldClockInitial(DateTime.now())) {
    _worldClockSubscription = _worldClock.currentLocalTime
        .listen((dateTime) => add(WorldClockTicked(dateTime)));
  }

  late final WorldClock _worldClock;
  late final StreamSubscription<DateTime> _worldClockSubscription;

  @override
  Stream<WorldClockState> mapEventToState(
    WorldClockEvent event,
  ) async* {
    if (event is WorldClockTicked) {
      yield* _mapWorldClockTickedToStream(event);
    }
  }

  @override
  Future<void> close() {
    _worldClockSubscription.cancel();
    return super.close();
  }

  Stream<WorldClockState> _mapWorldClockTickedToStream(
      WorldClockTicked event) async* {
    yield WorldClockRunning(event.dateTime);
  }
}
