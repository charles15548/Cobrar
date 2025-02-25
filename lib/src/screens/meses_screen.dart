import 'package:flutter/material.dart';
import 'pagos_screen.dart';

class MesesScreen extends StatelessWidget {
  final int clienteId;
  final List<String> meses = [
    "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
  ];

  MesesScreen(this.clienteId);

  void _seleccionarMes(BuildContext context, String mes) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PagosScreen(clienteId, mes)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seleccionar Mes")),
      body: ListView.builder(
        itemCount: meses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(meses[index]),
            onTap: () => _seleccionarMes(context, meses[index]),
          );
        },
      ),
    );
  }
}
