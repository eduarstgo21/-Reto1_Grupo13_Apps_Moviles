import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reto 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Mintic - Reto No 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1 = "COP";
String op2 = "USD";

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

List<DropdownMenuItem<String>> dd = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("8", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("7", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("6", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("5", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("4", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("3", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("2", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("1", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("0", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("Limpiar", Colors.lightBlue, Icon(Icons.cleaning_services)),
  calculadora("Calcular", Colors.lightBlue, Icon(Icons.calculate)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Origen : "),
                DropdownButton(
                    value: op1,
                    items: dd,
                    onChanged: (String? X) {
                      setState(() {
                        op1 = X.toString();
                      });
                    }),
                VerticalDivider(),
                VerticalDivider(),
                VerticalDivider(),
                Text("Destino : "),
                DropdownButton(
                    value: op2,
                    items: dd,
                    onChanged: (String? X) {
                      setState(() {
                        op2 = X.toString();
                      });
                    }),
              ],
            ),
            TextField(
              controller: textOrigen,
              decoration:
                  InputDecoration(labelText: "Moneda Origen", hintText: "0"),
            ),
            TextField(
                controller: textDestino,
                decoration:
                    InputDecoration(labelText: "Moneda Origen", hintText: "0")),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: cal.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: cal[index].color,
                  child: ListTile(
                    title: Center(
                      child: index > 9
                          ? cal[index].icono
                          : Text(cal[index].titulo),
                    ),
                    onTap: () {
                      if (index < 10) {
                        textOrigen.text = textOrigen.text + cal[index].titulo;
                      } else if (index == 10) {
                        textOrigen.text = "";
                        textDestino.text = "";
                      } else {
                        if (op1 == "USD" && op2 == "COP") {
                          textDestino.text =
                              (double.parse(textOrigen.text) * 5000).toString();
                        } else if (op1 == "COP" && op2 == "USD") {
                          textDestino.text =
                              (double.parse(textOrigen.text) / 5000).toString();
                        } else if (op1 == "EUR" && op2 == "COP") {
                          textDestino.text =
                              (double.parse(textOrigen.text) * 5100).toString();
                        } else if (op1 == "COP" && op2 == "EUR") {
                          textDestino.text =
                              (double.parse(textOrigen.text) / 5100).toString();
                        } else if (op1 == "EUR" && op2 == "USD") {
                          textDestino.text =
                              (double.parse(textOrigen.text) * 1.1).toString();
                        } else if (op1 == "USD" && op2 == "EUR") {
                          textDestino.text =
                              (double.parse(textOrigen.text) / 1.1).toString();
                        } else {
                          textDestino.text = textOrigen.text;
                        }
                      }

                      print(cal[index].titulo);
                    },
                  ),
                );
              },
            ))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
