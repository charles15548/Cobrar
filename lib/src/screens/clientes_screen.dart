import 'package:flutter/material.dart';
import '../database/sqlite_handler.dart';
import 'meses_screen.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});
  @override
  ClientesScreenState createState() => ClientesScreenState();
}

class ClientesScreenState extends State<ClientesScreen> {
  List<Map<String, dynamic>> clientes = [];

  @override
  void initState() {
    super.initState();
    _cargarClientes();
  }

  void _cargarClientes() async {
    final data = await SqliteHandler.instance.getClientes();
    setState(() {
      clientes = data;
    });
  }

  void _seleccionarCliente(int clienteId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MesesScreen(clienteId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clientes")),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clientes[index]['nombre']),
            subtitle: Text("Pago: ${clientes[index]['tipo_pago']}"),
            onTap: () => _seleccionarCliente(clientes[index]['id']),
          );
        },
      ),
    );
  }
}
