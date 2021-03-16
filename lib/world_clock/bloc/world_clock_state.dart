part of 'world_clock_bloc.dart';

abstract class WorldClockState extends Equatable {
  const WorldClockState();
  
  @override
  List<Object> get props => [];
}

class WorldClockInitial extends WorldClockState {}
