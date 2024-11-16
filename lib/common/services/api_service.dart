import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
// import 'package:hive/hive.dart';

import '../../app/utils/session_util.dart';

class ApiServices {
  ApiServices();

  static final FlavorConfig _configs = FlavorConfig.instance;
  static final SessionUtil _sessionUtil = SessionUtil();

  // Base URL Api Gateway
  String base = _configs.variables['base'];
  String urlCheckIp = 'https://api.ipify.org?format=json';

  // End point API

  // Fungsi untuk membuat instance Dio
  Dio get dio {
    return Dio()
      ..interceptors.add(DioCacheInterceptor(
        options: CacheOptions(
          priority: CachePriority.high,
          policy: CachePolicy.refresh,
          store: MemCacheStore(),
          allowPostMethod: false,
          maxStale: const Duration(days: 1),
          hitCacheOnErrorExcept: [401, 403],
          keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        ),
      ));
  }

  Future<String?> getToken() async {
    String? token = await _sessionUtil.readSession(_sessionUtil.authKey);
    return token;
  }

  // Untuk wadah cache response API
  // late Box<Map<String, dynamic>?> box;

  // Fungsi untuk menyimpan response API ke cache
  // Future<void> saveResponseToCache({
  //   required String key,
  //   required Map<String, dynamic> response,
  //   int timeout = 5, // default 60 seconds
  // }) async {
  //   String dataKey = 'DATA_${key.toUpperCase()}';
  //   String timeKey = 'TIME_CREATED_${key.toUpperCase()}';
  //   box = await Hive.openBox(dataKey);

  //   String cacheTimeout = DateTime.now().add(Duration(seconds: timeout)).toString();

  //   await _sessionUtil.writeSession(timeKey, cacheTimeout);
  //   box.put(dataKey, response);
  // }

  // Fungsi untuk mendapatkan response API dari cache
  // Future<Map<String, dynamic>?> getResponseFromCache(String key) async {
  //   String dataKey = 'DATA_${key.toUpperCase()}';
  //   String timeKey = 'TIME_CREATED_${key.toUpperCase()}';
  //   box = await Hive.openBox(dataKey);

  //   bool cacheIsTimeout = await cacheCheckTimeout(timeKey);
  //   debugPrint('DATA KEY : $dataKey, Cache is timeout: $cacheIsTimeout');

  //   if (cacheIsTimeout) {
  //     box.put(key, null);
  //     await _sessionUtil.deleteSession(timeKey);
  //     return null;
  //   } else {
  //     Map<String, dynamic>? data = box.get(dataKey);
  //     if (data == null) {
  //       return null;
  //     } else {
  //       return data;
  //     }
  //   }
  // }

  // Fungsi untuk mengecek apakah cache sudah timeout atau belum
  // Future<bool> cacheCheckTimeout(String key) async {
  //   String? dateTimeout = await _sessionUtil.readSession(key);
  //   DateTime now = DateTime.now();
  //   if (dateTimeout == null || now.compareTo(DateTime.parse(dateTimeout)) > 0) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
