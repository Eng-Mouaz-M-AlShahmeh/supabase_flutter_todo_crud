// Developed by: Eng Mouaz M Shahmeh
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:supabase_flutter_crud/src/modules/todo/application/todo.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<TodoProvider>(create: (context) => TodoProvider()),
];
