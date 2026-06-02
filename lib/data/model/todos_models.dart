class TodosModels {
  TodosModels({required this.id, required this.todo, required this.userId});

  final int id;
  final String todo;
  final int userId;

  factory TodosModels.fromTodos(Map<String, dynamic> todos) {
    return TodosModels(
      id: todos['id'], 
      todo: todos['todo'], 
      userId: todos['userId'],
    );
  }
}
