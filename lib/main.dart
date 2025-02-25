import 'package:flutter/material.dart';
import 'src/screens/clientes_screen.dart';
import 'src/database/sqlite_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("🔥 Iniciando la app...");
  
  await SqliteHandler.instance.database;
  
  print("✅ Base de datos inicializada.");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("🎯 Construyendo MyApp...");
    return MaterialApp(
      title: 'Cobra App',
      home: ClientesScreen(),
    );
  }
}
