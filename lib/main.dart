// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cajas de texto",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controlador = TextEditingController();
  String resultado = "";

  Widget botonRedondo(String btnTxt, Color btnColor, Color txtColor) {
    return Container(
      width:100.0,
        child: ElevatedButton(

          onPressed: () {
            setState(() {
              var calculo=int.parse(controlador.text)*int.parse(controlador.text);
              resultado=calculo.toString();
            });
                },
          child: Text(
            btnTxt,
            style: TextStyle(
              fontSize: 35,
              color: txtColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: btnColor, // <-- Button color
            onPrimary: Colors.red, // <-- Splash color
          ),
        )
    );
  }


  Widget botonCuadrado(){
    return ElevatedButton(
      onPressed:()
      {
        print("Pulsado");
        print(controlador.text);
        setState(() {
          var calculo=int.parse(controlador.text)*2;
          resultado=calculo.toString();
        });

      },
      style: ButtonStyle(
          maximumSize:
          MaterialStateProperty.all(const Size(200.0, 100.0))),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.audiotrack,
                  size: 10,
                ),
                Text("Pulsar")
              ]
          )
      ),

    );
  }

Widget cajaTexto() {
    return
      Container(
          width: 200.0,
          child:
          TextField(
            controller: controlador,
            autofocus: true,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.send,  // icono del botón
            autocorrect: true,
            textAlign: TextAlign.center,
            maxLength:20,
            obscureText: false, // passowrd
            style: TextStyle(
                color: Colors.red
            ),
            decoration: InputDecoration(
              //icon: Icon(Icons.three_g_mobiledata_outlined),
              prefixIcon: Icon(Icons.three_g_mobiledata_outlined),
              //prefixIcon: CircularProgressIndicator(),
              hintText: "Introducir",
              hintStyle:TextStyle(color: Colors.green),
              helperText: "Introducir datos",
            ),
          )
      )

        ;
}

Widget espacio(){
    return Container(
      height: 10,
    );

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cajas de texto"),
      ),
      body: Column(
        children: [
          espacio(),
          Row(
            children: [
                  Text("Introducir dato "),
              cajaTexto()
            ]
          ),
          espacio(),
          botonCuadrado(),
          espacio(),
          Text("$resultado"),
          espacio(),
          botonRedondo("x²",Colors.black,Colors.red),

        ],


      ),
    );
  }
}

