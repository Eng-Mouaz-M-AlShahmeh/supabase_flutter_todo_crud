// Developed by: Eng Mouaz M Shahmeh
import 'package:flutter/material.dart';
import 'package:supabase_flutter_crud/src/modules/todo/data/supabasehandler.dart';
import 'package:supabase_flutter_crud/src/modules/todo/domain/todo.dart';

class TodoProvider extends ChangeNotifier {
  SupaBaseHandler supabaseHandler = SupaBaseHandler();

  String _taskValue = '';
  String get taskValue => _taskValue;
  setTaskValue(String value) => _taskValue = value;

  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  bool _loading = false;
  bool get loading => _loading;

  readTodos() async {
    _loading = true;
    _todos = [];
    List data = await supabaseHandler.readData();
    for (var e in data) {
      _todos.add(TodoModel.fromJson(e));
    }
    _loading = false;
    notifyListeners();
    return;
  }

  addTodos(String newValue, {bool status = false}) async {
    supabaseHandler.addData(newValue, status);
    readTodos();
    notifyListeners();
    return;
  }

  updateTodos(int id) async {
    supabaseHandler.updateData(id, true);
    readTodos();
    notifyListeners();
    return;
  }

  deleteTodos(int id) async {
    supabaseHandler.deleteData(id);
    readTodos();
    notifyListeners();
    return;
  }
}
