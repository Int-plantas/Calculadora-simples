// Importação automática material flutter
import 'package:flutter/material.dart';                 


// Stateful = pode ser mudado
// A classe Calculadora possui estado e poderá ser mudada
class Calculadora extends StatefulWidget {              
  @override
  State createState() => CalculadoraState();
}


// Criamos o estado e agora podemos manipulá-lo através do construtor build
// Build = "Construtor"
// Scaffold = "Esqueleto do app"
// AppBar = "Barra superior do app"
// Body = "Corpo do app"
// Padding = "Espaçamento"

class CalculadoraState extends State<Calculadora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora simples"),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[

            // Texto que mostra o resultado do calculo
            Text(
              "Resultado: $resultado",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
            ),



            // Campo de texto (input do valor 1)
            new TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Informe o valor 1"),
              controller: t1,
              ),




            // Campo de texto (input do valor 2)
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Informe o valor 2"),
              controller: t2),



            //Espacamento dos inputs 
            Padding(
              padding: const EdgeInsets.only(top: 20)),



            //Nova linha (row)
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.blueAccent,
                  onPressed: somar),
              ],
            ),



            //Espacamento depois do botao
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),

            //Botao limpar 
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Limpar"),
                  color: Colors.grey,
                  onPressed: limpar),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Atributos 
  var num1;
  var num2;
  var resultado = 0;

  TextEditingController t1 = TextEditingController(text: "");
  TextEditingController t2 = TextEditingController(text: "");

  //Metodos
  void somar() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      resultado = num1 + num2;
    });
  }

    void limpar() {
      setState(() {
        t1.text = "";
        t2.text = "";
        
      });
    }

} // fecha CalculadoraState



