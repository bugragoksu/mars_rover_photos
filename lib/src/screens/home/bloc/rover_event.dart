part of 'rover_bloc.dart';

@immutable
abstract class RoverEvent {}

class RoverFetchEvent extends RoverEvent {
  final RoverRequestModel model;

  RoverFetchEvent({required this.model});
}
