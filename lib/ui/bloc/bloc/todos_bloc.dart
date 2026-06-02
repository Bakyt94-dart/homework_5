import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter4_5/data/model/todos_models.dart';
import 'package:flutter4_5/data/model/todos_params_model.dart';
import 'package:flutter4_5/data/service/api_service.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodoEvent, TodosState> {
  final ApiService apiService = ApiService();
  TodosBloc() : super(TodoInitial()) {
    on<SearchTodoEvent>(_searchTodos!);
    on<TodoEvent>(Todo!);
  }
  
  EventHandler<SearchTodoEvent, TodosState>? get _searchTodos => null;
  
  EventHandler<TodoEvent, TodosState>? get Todo => null;
  
  List<TodosModels>? get listTodos => null;

  Future<void> Todos(
    SearchTodoEvent event,
    Emitter<TodosState> emit,
  ) async {
    try {
      emit(LoadingTodosState());

      final TodosModels todos = await apiService.getTodos(
        event.todo!,
      );
      emit(LoadedTodoState(todosModels: todos));
    } catch (error, stackTrace) {
      Talker().handle(error, stackTrace);
      emit(ErrorTodosState());
    }
  }

  Future<void> _searchTodo(
    SearchTodoEvent event,
    Emitter<TodosState> emit,
  ) async {
    try {
      emit(LoadingTodosState());
      final listTodos = await apiService.getTodos(event.params);
      emit(LoadedTodosState(TodoList: [listTodos]));
    } catch (error, stackTrace) {
      Talker().handle(error, stackTrace);
      emit(ErrorTodosState());
    }
  }
}