class TodosParamsModel {
  final int id;
  final String todo;
  final int userId;

  TodosParamsModel({
    required this.id,
    required this.todo,
    required this.userId, required String ,
  });

  Map<String, dynamic> toTodos() => {
    'id': id, 
    'todo': todo, 
    'userId': userId
  };
}
