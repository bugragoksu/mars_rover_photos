import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rover_repository/rover_repository.dart';

part 'rover_event.dart';
part 'rover_state.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  RoverBloc() : super(RoverInitial());

  @override
  Stream<RoverState> mapEventToState(
    RoverEvent event,
  ) async* {
    if (event is RoverFetchEvent) {
      try {
        yield RoverFetching();
        //fetch
        yield RoverFetched(RoverModel(photos: []));
      } catch (e) {
        yield RoverFetchFailed(e.toString());
      }
    }
  }
}
