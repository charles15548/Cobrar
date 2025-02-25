// screens/clientes_screen.dart
import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class ClientesScreen extends StatefulWidget {
  @override
  _ClientesScreenState createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();

  void _agregarCliente() async {
    final db = await DatabaseHelper.instance.database;
    await db.insert(
      'clientes',
      {'nombre': _nombreController.text, 'monto': double.parse(_montoController.text)},
    );
    Navigator.pop(context);
  }

  void _mostrarFormularioAgregarCliente() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar Cliente'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre del Cliente'),
              ),
              TextField(
                controller: _montoController,
                decoration: InputDecoration(labelText: 'Monto Mensual'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: _agregarCliente,
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clientes')),
      body: Center(child: Text('Aquí se agregarán los clientes')),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarFormularioAgregarCliente,
        child: Icon(Icons.add),
      ),
    );
  }
}