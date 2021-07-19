import 'package:http_helper/http_helper.dart';

import '../rover_repository.dart';

class RoverRepository {
  Future<RoverModel> getRover({required String type}) async {
    var result = HttpHelper().get('$type/photos?sol=1000&api_key=DEMO_KEY');
    return roverFromJson(result);
  }
}
