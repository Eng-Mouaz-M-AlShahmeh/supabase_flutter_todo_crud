// Developed by: Eng Mouaz M Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter_crud/src/modules/todo/presentation/todo.dart';
import 'package:supabase_flutter_crud/src/shared/providers.dart';
import 'package:supabase_flutter_crud/src/shared/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: SharedStrings.appTitle,
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: TodoPage(title: SharedStrings.appTitle),
          );
        });
  }
}
