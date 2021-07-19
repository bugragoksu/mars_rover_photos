part of 'rover_bloc.dart';

@immutable
abstract class RoverEvent {}

class RoverFetchEvent extends RoverEvent {
  final String roverType;

  RoverFetchEvent(this.roverType);
}
