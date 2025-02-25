import 'package:flutter/material.dart';
import 'screens/empresa_screen.dart';
import 'database/database_helper.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cobranza de Inquilinos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EmpresaScreen(),
    );
  }
}

