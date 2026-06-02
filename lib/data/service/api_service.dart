
import 'package:dio/dio.dart';
import 'package:flutter4_5/data/model/todos_models.dart';
import 'package:flutter4_5/data/model/todos_params_model.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<TodosModels> getTodos(
    TodosParamsModel params,
  ) async {
    final Response response = await _dio.get(
      'https://dummyjson.com/todos',
      queryParameters: params.toTodos(),
    );
    final TodosModels todosModels = TodosModels.fromTodos(
      response.data,
    );
    return todosModels;
  }
}