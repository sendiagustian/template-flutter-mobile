import 'package:dio/dio.dart';

import '../../common/services/api_service.dart';

class IpDeviceRepository {
  static final ApiServices _apiServices = ApiServices();
  static final Dio dio = _apiServices.dio;

  Future<String?> getIpDevice() async {
    try {
      String url = _apiServices.urlCheckIp;
      Response response = await dio.get(url);
      return response.data['ip'];
    } catch (e) {
      return null;
    }
  }
}
