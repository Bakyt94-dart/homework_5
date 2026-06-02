part of 'todos_bloc.dart';

sealed class TodosState extends Equatable {
  const TodosState();
  @override
  List<Object?> get props => [];

  get todoList => null;

}

final class TodoInitial extends TodosState {
  @override
  List<Object> get props => [];
}

final class LoadedTodosState extends TodosState {
  
  final List<TodosModels> TodoList;

  LoadedTodosState({required this.TodoList});
}

final class LoadedTodoState extends TodosState {
  final TodosModels todosModels;

  LoadedTodoState({required this.todosModels});

  @override
  List<Object?> get props => [todosModels];
}

final class ErrorTodosState extends TodosState {}

final class LoadingTodosState extends TodosState {}