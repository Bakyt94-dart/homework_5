part of 'todos_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

final class SearchTodoEvent extends TodoEvent {
  const SearchTodoEvent({required this.params});

  final TodosParamsModel params;

  @override
  List<Object?> get props => [params];

  TodosParamsModel? get todo => null;

}

final class TodosEvent extends TodoEvent {
  const TodosEvent({required this.todo});

  final TodosParamsModel todo;

  @override
  List<Object?> get props => [todo];
}