import 'package:dio/dio.dart';
import 'package:flutter_bloc_example/constants/app_constants.dart';
import 'package:flutter_bloc_example/utils/shared_pref_util.dart';

class NetworkUtil {
  NetworkUtil._privateConstructor();

  static final NetworkUtil instance = NetworkUtil._privateConstructor();

  final String baseUrl = AppConstants.baseUrl;

  late Dio _dio;

  void initialize() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    _dio = Dio(options);

    // _dio.interceptors.add(LogInterceptor(error: true));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String token =
            SharedPrefUtil.instance.getString(SharedPrefUtil.keyAuthToken);

        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error occurred: $e');
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      Response response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error occurred: $e');
    }
  }
}

// Custom exception class for API errors
class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  static ApiException fromDioError(DioException e) {
    String message = 'Request failed';
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          message = e.response!.data['message'] ?? 'Bad request';
          break;
        case 401:
          message = e.response!.data['message'] ?? 'Unauthorized';
          break;
        case 403:
          message = e.response!.data['message'] ?? 'Forbidden';
          break;
        case 404:
          message = e.response!.data['message'] ?? 'Not found';
          break;
        case 500:
          message = e.response!.data['message'] ?? 'Internal server error';
          break;
        case 503:
          message = e.response!.data['message'] ?? 'Service unavailable';
          break;
        default:
          message = 'Request failed with status code ${e.response!.statusCode}';
          break;
      }
    } else {
      message = 'Request failed: ${e.message}';
    }

    return ApiException(message);
  }
}
