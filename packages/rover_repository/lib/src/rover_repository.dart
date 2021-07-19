import '../rover_repository.dart';
import 'model/rover_model.dart';

class RoverRepository {
  Future<RoverModel> getRover({required String type}) async {
    return RoverModel(photos: []);
  }
}
