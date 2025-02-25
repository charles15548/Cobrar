import 'package:flutter/material.dart';
import '../database/sqlite_handler.dart';

class PagosScreen extends StatefulWidget {
  final int clienteId;
  final String mes;

  const PagosScreen(this.clienteId, this.mes,{super.key});

  @override
  PagosScreenState createState() => PagosScreenState();
}

class PagosScreenState extends State<PagosScreen> {
  double monto = 0.0;
  final TextEditingController _montoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarMonto();
  }

  void _cargarMonto() async {
    double montoGuardado =
        await SqliteHandler.instance.getMonto(widget.clienteId, widget.mes);
    setState(() {
      monto = montoGuardado;
    });
  }

  void _guardarPago() async {
    double nuevoMonto = double.tryParse(_montoController.text) ?? 0;
    if (nuevoMonto > 0) {
      await SqliteHandler.instance
          .agregarPagoMes(widget.clienteId, widget.mes, nuevoMonto);
      _cargarMonto(); // Recargar el monto actualizado
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagos de ${widget.mes}")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Monto actual: \$${monto.toStringAsFixed(2)}"),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Nuevo pago"),
            ),
            ElevatedButton(
              onPressed: _guardarPago,
              child: Text("Agregar Pago"),
            ),
          ],
        ),
      ),
    );
  }
}
