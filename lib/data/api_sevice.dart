import 'package:bloc_pratice/data/model/data_model.dart';
import 'package:bloc_pratice/data/universal_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  // DIO SETTINGS

  final _dio = Dio(
    BaseOptions(
      baseUrl: "https://fifth-exam.free.mockoapp.net/",
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      sendTimeout: Duration(seconds: 20),
    ),
  );

  ApiService() {
    _init();
  }

  _init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          //error.response.statusCode
          debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV  YUBORILDI :${requestOptions.path}");
          // return handler.resolve(Response(requestOptions: requestOptions, data: {"name": "ali", "age": 26}));
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB  KELDI :${response.requestOptions.path}");
          return handler.next(response);
        },
      ),
    );
  }

  //----------------------- AUTHENTICATION -------------------------

  Future<UniversalData> getData() async {
    Response response;
    try {
      response = await _dio.get(
        '/users',
      );

      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(
          data: (response.data as List?)
                  ?.map((e) => DataModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
