import 'package:http_helper/http_helper.dart';

import '../rover_repository.dart';
import 'model/rover_request_model.dart';

class RoverRepository {
  Future<RoverModel> getRover({required RoverRequestModel model}) async {
    var result = await HttpHelper().get(
        '${model.type}/photos?sol=1000&api_key=DEMO_KEY&camera=${model.cameraType}');
    return roverFromJson(result);
  }
}
