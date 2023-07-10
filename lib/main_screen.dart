import 'package:flutter/material.dart'; // libreria principal para el uso de flutter

// se llama a los archivos que contienen la vista de cada una de las ventanas de la app
import 'mapas.dart';


class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final List<String> title = [ // una lista que controla el "titulo" de la barra superior dependiendo de la ventana en donde se encuentre
    'Paradas',
    'Mapas',
    'Anuncios',
    'Configuración',
  ];

  @override
  State<MainScreen> createState() => _MainScreenState(); // crea una "extencion" para que el stateLessWidget de la clase principal pueda tener estados variados y modificables
}

class _MainScreenState extends State<MainScreen> {


  int _salectedScreen = 1; // inicializa la variable de la vista seleccionada para que la app inicie mostrando la vista de los Mapas
  final String _userName = 'Nombre Usuario'; // declara el nombre del usuario, este se mostrara en la barra superior

  final views = [
    // aqui se agregan las vistas que va a tener la barra de navegacion, dependiendo de el index en el que este la vista cambiará
    const MapasScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea( // el SafeArea sirve para evitar que el borde superior de la aplicacion choque con la barrra de informacion superior del celular

      child: Scaffold( // widget que nos permite organizar nuestras pantallas, dar el orden de: AppBar, Body, BottomNavigationBar

          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1, // toma la distancia vertical de la pantalla y la multiplica por el 10%
            elevation: 5, // le da una sombra a la barra superior, entre mayor sea el numero mayor sera la distancia qye hay entre la sombra y la barra
            backgroundColor: const Color.fromRGBO(94, 217, 202, 1), // determina el color que tendra la barra superior

            title: Row( // dice que el 'titulo' sera una fia con distintos elementos

              mainAxisAlignment: MainAxisAlignment.start, // los elemntos estaran alineados hacia el inicio de la fila

              children: [

                CircleAvatar( // se usa para poner un circulo el cual contendra la foto de usuario
                  backgroundImage: const AssetImage('assets/images/user_cat.png'), // pone la imagen de fondo
                  radius: MediaQuery.of(context).size.height * 0.035, // le da el tamaño al radio del circulo donde estara la imagen
                ),

                const Padding(padding: EdgeInsets.only(right: 20)), // genera un espacio entre la imagen y el texto que le sigue

                Column( // se hace otro elemento que hubicara objetos de manera vertical

                  crossAxisAlignment: CrossAxisAlignment.start, // alinea los textos hacia la izquierda

                  children: [
                    SizedBox( // se genera una caja, es parecido a un container para que el texto no se salga de la pantalla
                      width: MediaQuery.of(context).size.width * 0.7, // le da un ancho a la caja igual al 70% del ancho de la pantalla

                      child: Text(
                        _userName, // se imprime el nombre del usuario antes declarado
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05), // se le da un tamaño variable al texto el cual se ajustara al tamaño de la pantalla 5%
                        overflow: TextOverflow.ellipsis, // usado para decir que si el textos es demasiado largo entonces lo corte y ponga puntos suspensivos para dar señal de qu eno dio espacio para escribir el nombre
                      ),
                    ),

                    Text(
                      widget.title[_salectedScreen], // dependiendo de la vista en la que se encuentre se imprimira un segundo titulo
                      style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03), // se le da un tamaño variable al texto el cual se ajustara al tamaño de la pantalla 3%
                    )
                  ],
                )
              ],
            ),
          ),


          /*body: IndexedStack( // widget proporcionado para poder navegar entre las ventanas sin perder la informacion que haya en ellas
            index: _salectedScreen, // pide la base de cual es el index de la vista actual
            children: views, // dependiendo del index llama una vista de las que hay almacenada en la lista de vistas declarada anteriormente
          ),*/ // body cuando se tienen todas las vistas disponibles
          body: const MapasScreen(),


          bottomNavigationBar: BottomNavigationBar(

            type: BottomNavigationBarType.fixed, // permite agregar mas de 3 elementos en la barra de navegacion, qsi no se pone

            selectedItemColor: Colors.white, // cambia el color cuando la ventana es seleccionada
            selectedIconTheme: IconThemeData(size: MediaQuery.of(context).size.height * 0.06), // cambia el tamaño de la pestaña seleccionada
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold), // convierte la letra de la ven tana seleccionada a negrilla

            unselectedItemColor: Colors.grey[250], // cambia el color cuando la ventana NO es seleccionada
            unselectedIconTheme: IconThemeData(size: MediaQuery.of(context).size.height * 0.05), // camia el tamaño de la NO seleccion

            backgroundColor: const Color.fromRGBO(94, 217, 202, 1), // cambia el color de fondo de la barra

            items: const [
              // lista de los items que apareceran en la barra de navegacion
              BottomNavigationBarItem(
                  icon: Icon(Icons.train_outlined),
                  activeIcon: Icon(Icons.train), // cambia el icono cuando este esta activo
                  label: 'Paradas'
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined),
                  activeIcon: Icon(Icons.map),
                  label: 'Mapas'
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined),
                  activeIcon: Icon(Icons.list_alt), // cambia el icono cuando este esta activo
                  label: 'Anuncios'
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings), // cambia el icono cuando este esta activo
                  label: 'Ajustes'
              ),

            ],
            currentIndex: _salectedScreen, // guarda en la variable de CurrentIndex el index del icono seleccionado para decirle al programa donde esta hubicado

            onTap: (int index) { //
              setState(() { // cambia el estado de una variable dependidnedo de lo que se haga en pantalla
                _salectedScreen = index;
              });
            },
          )),
    );
  }
}
