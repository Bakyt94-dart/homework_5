import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter4_5/data/model/todos_params_model.dart';
import 'package:flutter4_5/ui/bloc/bloc/todos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodosBloc _todosBloc = TodosBloc();

  @override
  void initState() {
    _todosBloc.add(
      SearchTodoEvent(
        params: TodosParamsModel(id: 'id', todo: 'todo', userId: 'userId', String: ''),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<TodosBloc, TodosState>(
            bloc: _todosBloc,
            builder: (context, state) {
              if (State is LoadedTodoState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                      },
                      child: Column(
                        children: [
                          Text(
                            state.todoList[index].name,
                            style: TextStyle(fontSize: 50),
                          ),
                          SizedBox(height: 8),

                          Text(
                            state.todoList[index].displayName,
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              if (state is ErrorTodosState) {
                return Text(
                  'Flutter 04',
                  style: TextStyle(fontSize: 50, color: Colors.red),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
