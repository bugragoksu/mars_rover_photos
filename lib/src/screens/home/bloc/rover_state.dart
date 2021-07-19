part of 'rover_bloc.dart';

@immutable
abstract class RoverState {}

class RoverInitial extends RoverState {}

class RoverFetching extends RoverState {}

class RoverFetched extends RoverState {
  final RoverModel rover;

  RoverFetched(this.rover);
}

class RoverFetchFailed extends RoverState {
  final String message;

  RoverFetchFailed(this.message);
}
