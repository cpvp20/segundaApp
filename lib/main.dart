import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITESO App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isUpPressed = false;
  bool isDownPressed = false;
  int counter = 9999;

  _showSelectionDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("Dialogo contador de likes"),
            content: Text(counter % 2 == 1
                ? new DateTime.now().toString()
                : "El contador de likes es par"),
            actions: [
              MaterialButton(
                  child: Text("CERRAR"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Image.asset('assets/pic.jpg'),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('El ITESO, Universidad Jesuita de Guadalajara',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    Text(
                      'San Pedro Tlaquepaque, Jal.',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: isUpPressed ? Colors.blue : Colors.grey[600],
                        ),
                        onPressed: () {
                          isUpPressed = !isUpPressed;
                          print("Up Presionado: $isUpPressed");
                          counter++;
                          setState(() {});
                        }),
                    IconButton(
                      icon: Icon(
                        Icons.thumb_down,
                        color: isDownPressed ? Colors.red : Colors.grey[600],
                      ),
                      onPressed: () {
                        isDownPressed = !isDownPressed;
                        print("Down Presionado: $isDownPressed");
                        counter--;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("$counter", style: TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 34.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //3 botones
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.mail, size: 48, color: Colors.grey[800]),
                      onPressed: () {
                        _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("admision@iteso.mx"),
                            ),
                          );
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.phone, size: 48, color: Colors.grey[800]),
                      onPressed: () {
                        _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("33 3669 3434"),
                            ),
                          );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.directions,
                          size: 48, color: Colors.grey[800]),
                      onPressed: () {
                        _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Anillo Perif. Sur Manuel Gómez Morín 8585, Santa María Tequepexpan, 45604 San Pedro Tlaquepaque, Jal. "),
                            ),
                          );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 34.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Text("  Correo",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]))
                ]),
                Column(children: [
                  Text(" Llamada",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]))
                ]),
                Column(children: [
                  Text(" Ruta",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]))
                ]),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 52.0,
            ),
            child: Text(
                "El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.",
                style: TextStyle(fontSize: 13)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    IconButton(
                        icon: Icon(Icons.check_circle_outline_outlined,
                            size: 44, color: Colors.blue),
                        onPressed: () {
                          _showSelectionDialog(context, counter);
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
