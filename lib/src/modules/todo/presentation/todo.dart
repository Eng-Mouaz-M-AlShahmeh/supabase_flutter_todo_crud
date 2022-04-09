// Developed by: Eng Mouaz M Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter_crud/src/modules/todo/application/todo.dart';
import 'package:supabase_flutter_crud/src/shared/strings.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var todoProvider = context.read<TodoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(SharedStrings.appTitle),
      ),
      body: Consumer<TodoProvider>(builder: (context, todo, child) {
        var screenSize = MediaQuery.of(context).size;

        return todo.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: screenSize.height * 0.9,
                child: ListView.builder(
                    itemCount: todo.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: todo.todos[index].status!
                            ? Colors.white
                            : Colors.red,
                        title: Text(todo.todos[index].task!),
                        trailing: SizedBox(
                          width: 200,
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    todoProvider
                                        .updateTodos(todo.todos[index].id!);
                                  },
                                  icon: const Icon(Icons.done)),
                              IconButton(
                                  onPressed: () {
                                    todoProvider
                                        .deleteTodos(todo.todos[index].id!);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    }),
              );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: TextField(
                onChanged: (value) => todoProvider.setTaskValue(value),
              )),
              FloatingActionButton(
                onPressed: () => todoProvider.addTodos(todoProvider.taskValue),
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () async => await todoProvider.readTodos(),
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
