import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/services/cache/cache_helper.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';

    final token = CacheHelper.getString(ApiKey.token);
    if (token != null) {
      options.headers[ApiKey.token] = '${ApiKey.tokenPrefix} $token';
    }

    super.onRequest(options, handler);
  }
}
