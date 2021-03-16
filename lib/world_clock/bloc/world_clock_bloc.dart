import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'world_clock_event.dart';
part 'world_clock_state.dart';

class WorldClockBloc extends Bloc<WorldClockEvent, WorldClockState> {
  WorldClockBloc() : super(WorldClockInitial());

  @override
  Stream<WorldClockState> mapEventToState(
    WorldClockEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
