import 'package:flutter/material.dart';                 


// Stateful = pode ser mudado
// A classe Calculadora possui estado e poderá ser mudada
class Calculadora extends StatefulWidget {
  const Calculadora({super.key});
              
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
              // O cifrão serve para indicar que é uma variável, e não texto
              // As chaves servem para fazer interpolação
              // Interpolação é para fazer uma modificação, nesse caso da variável
              // Convertemos a var para string e fixamos em 1 casa após a vírgula
              // Mascaras e formatacoes devem sempre ser realizadas onde se exibe
              "Resultado: ${resultado.toStringAsFixed(1)}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
            ),



            // Campo de texto (input do valor 1)
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Informe o valor 1"),
              controller: t1,
              ),




            // Campo de texto (input do valor 2)
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Informe o valor 2"),
              controller: t2),



            //Espacamento dos inputs 
            const Padding(
              padding: EdgeInsets.only(top: 20)),



            //Nova linha (row) botao somar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                //Botao somar
                MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: somar,
                  child: const Text("+")
                  ),

                //Botao subtrair
                MaterialButton(
                  color: Colors.green,
                  onPressed: subtrair,
                  child: const Text("-",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                  ))
                ),
              ],
            ),

            //Espacamento depois do botao somar
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),


            //Nova linha para botao limpar 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                //Botao limpar
                MaterialButton(
                  color: Colors.grey,
                  onPressed: limpar,
                  child: const Text("Limpar")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Atributos 

  num num1 = 0;
  num num2 = 0;
  num resultado = 0;


  // Variável de texto que irá receber os valores dos INPUTS em forma de texto, são inicializados em branco: ""
  TextEditingController t1 = TextEditingController(text: "");
  TextEditingController t2 = TextEditingController(text: "");



  // Metodos
  void somar() {
    // Invocamos o método setstate sempre que formos alterar o valor de alguma variável
    setState(() {
      // Transformamos o texto de controle t1 e t2 para inteiros
      num1 = num.parse(t1.text);
      num2 = num.parse(t2.text);
      resultado = num1 + num2;
    });
  }

  void limpar() {
     setState(() {
       t1.text = "";
       t2.text = "";
       
     });
   }

  void subtrair(){
    setState(() {
      num1 = num.parse(t1.text);
      num2 = num.parse(t2.text);
      resultado = num1 - num2;
    });
  }


} // fecha CalculadoraState



