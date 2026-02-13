import 'package:dio/dio.dart';

extension ResponseExtension<T> on Response<T>{
  bool get success => statusCode != null && statusCode! >= 200 && statusCode! < 300;
  bool get redirected => statusCode != null && statusCode! >= 300 && statusCode! < 400;
  bool get clientError => statusCode != null && statusCode! >= 400 && statusCode! < 500;
  bool get serverError => statusCode != null && statusCode! >= 500 && statusCode! < 600;
  bool get unauthorized => statusCode != null && statusCode! == 401;
}