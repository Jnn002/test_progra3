import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as conexion;
export 'package:testeodart/formulario.dart';

class HomeFormulario extends StatelessWidget {
  HomeFormulario({super.key});
  final _apellidoController = TextEditingController();
  final _correoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _punteoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envio de datos'),
        shadowColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellido', 
                  ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo', 
                  ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre', 
                  ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _punteoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Punteo', 
                  ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 180,
                child: ElevatedButton(
                  onPressed: () => sendData(),
                  child: const Row(
                    children: [
                    Text('Enviar datos'),
                    SizedBox(width: 25),
                    Icon(Icons.send),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendData() async {
    try {
      Map<String, dynamic> body = {
        'Alumno': {
          'Apellido': _apellidoController.text.trim(),
          'Correo': _correoController.text.trim(),
          'Nombre': _nombreController.text.trim(),
          'Punteo': _punteoController.text.trim(),
        }
      };
      String jsonData = jsonEncode(body);
      var response = await conexion.post(
        Uri.parse(''),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonData,
      );
      print('Respuesta de estado: ${response.statusCode}');
      print('Confirmación de recepcion e ID_Doc: ${response.body}');
    } catch (e) {
      print(e);
    }
  }
}
