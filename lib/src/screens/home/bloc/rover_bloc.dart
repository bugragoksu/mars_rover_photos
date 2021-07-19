import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rover_repository/rover_repository.dart';

part 'rover_event.dart';
part 'rover_state.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  RoverBloc(this.roverRepository) : super(RoverInitial());
  final RoverRepository roverRepository;
  @override
  Stream<RoverState> mapEventToState(
    RoverEvent event,
  ) async* {
    if (event is RoverFetchEvent) {
      try {
        yield RoverFetching();
        var result = await roverRepository.getRover(model: event.model);
        yield RoverFetched(result);
      } catch (e) {
        yield RoverFetchFailed(e.toString());
      }
    }
  }
}
