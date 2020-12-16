import 'package:machine_test/pages/home/bloc/data/home_model.dart';
import 'package:machine_test/services/network/make_http_request.dart';

class HomeRepo {
  final HomeModel homeModel = new HomeModel();

  Future<HomeModel> getHomeData() async {
    var response = await MakeHttpRequest.makeHttpRequest(
        path: "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad");

    if (response == null) {
      throw MakeHttpRequest.ERROR_MSG;
    }

    if (response['errorMsg'] != null) {
      throw response['errorMsg'];
    }

    homeModel.fillHomeCategories(response['data'][0]);
    return homeModel;
  }
}
