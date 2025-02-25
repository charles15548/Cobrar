// screens/empresa_screen.dart
import 'package:flutter/material.dart';
import 'clientes_screen.dart';

class EmpresaScreen extends StatelessWidget {
  final TextEditingController _empresaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingrese su Empresa')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _empresaController,
              decoration: InputDecoration(labelText: 'Nombre de la Empresa'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientesScreen()),
                );
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
