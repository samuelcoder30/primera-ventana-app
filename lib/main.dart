import 'package:flutter/material.dart'; // importar la libreria de flutter para poder hacerla
import 'main_screen.dart'; // importar el MainScreen para usarlo en el home

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // el constructor principal de la clase MyApp

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Imprima'), // establece la fuente de escritura 'Imprima' como predeterminada
      debugShowCheckedModeBanner: false, // no permite que aparezca la etiqueda de 'debug'
      title: 'SPAT', // el titulo de la app cuando se ve desde el historial de aplicaciones

      home: MainScreen(), // llama la clase main screen para que sea lo que se ejecute (en esta se encuentran las  vistas y el resto de codigo)
    );
  }
}
