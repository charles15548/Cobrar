import 'package:flutter/material.dart';
import 'screens/clientes_screen.dart';
import 'database/sqlite_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await SqliteHandler.instance.database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestión de Pagos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ClientesScreen(),
    );
  }
}
