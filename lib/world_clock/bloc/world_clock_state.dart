part of 'world_clock_bloc.dart';

abstract class WorldClockState extends Equatable {
  const WorldClockState(this.dateTime);
  final DateTime dateTime;

  @override
  List<Object> get props => [];
}

class WorldClockInitial extends WorldClockState {
  WorldClockInitial(DateTime dateTime) : super(dateTime);
}

class WorldClockRunning extends WorldClockState {
  WorldClockRunning(DateTime dateTime) : super(dateTime);
}
