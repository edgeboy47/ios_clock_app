part of 'world_clock_bloc.dart';

abstract class WorldClockEvent extends Equatable {
  const WorldClockEvent();

  @override
  List<Object> get props => [];
}

class WorldClockTicked extends WorldClockEvent {
  WorldClockTicked(this.dateTime);
  final DateTime dateTime;
}

class WorldClockOffsetChanged extends WorldClockEvent {
  WorldClockOffsetChanged();

  //TODO: Define how UTC Offset is represented
}
