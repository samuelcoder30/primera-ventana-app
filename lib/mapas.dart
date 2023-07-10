import 'package:flutter/material.dart'; // libreria principal para el uso de flutter

class MapasScreen extends StatefulWidget{
  const MapasScreen({super.key});

  @override
  State<MapasScreen> createState() => _MapasScreenState(); // crea una "extencion" para que el stateLessWidget de la clase principal pueda tener estados variados y modificables
}

class _MapasScreenState extends State<MapasScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350], // color del fondo de la app

      body: Center(
        child: SizedBox( // esto permitira que la imagen del mapa se expanda por toda la pantalla
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,

          child: InteractiveViewer( // permite que el objeto por dentro sea expandible

            maxScale: 5, // determina el maximo de zoom que se le puede hacer a la imagen del mapa

            child: Image.asset(
                'assets/images/mapa_metro.png' // imagen que sera mostrada, para poder mostrar las imagenes, la direccion de estas debe ser primero agregada a su respectiva secion en el archivo pubspec.yaml
            ),
          ),
        ),
      ),
    );
  }

}

