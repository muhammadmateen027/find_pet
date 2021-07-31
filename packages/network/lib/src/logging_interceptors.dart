
import 'package:dio/dio.dart';

/// A sub-class of the Interceptor to do some custom actions
class LoggingInterceptors extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// will check the condition to show full page loading progress
    if (options.extra['customProgress'] ?? true) {
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /// in response we will check if customProgress is enabled then we will
    /// dismiss
    if (response.extra['customProgress'] ?? true) {
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    /// in response we will check if customProgress is enabled then we will
    /// dismiss

    super.onError(err, handler);
  }
}
