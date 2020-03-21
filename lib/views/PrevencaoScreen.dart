import 'package:flutter/material.dart';

class PrevencaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  "Algumas medidas devem ser tomadas para se previnir do corona vírus.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(height: 25),
              Text(
                "- Lave com sabão sua mão várias vezes ao dia.",
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              SizedBox(height: 25),
              Text(
                "- Cobrir nariz e boca quando for tossir ou espirrar.",
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              SizedBox(height: 25),
              Text(
                "- Evitar tocar nos olhos e boca.",
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              SizedBox(height: 25),
              Text(
                "- Evitar contato ou ficar no mesmo ambiente de pessoas infectadas.",
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              SizedBox(height: 25),
              Text(
                "- Não compartilhar itens de uso pessoal como copos, talheres, etc.",
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 50),
              Text("Os principais sintomas são: febre, tosse e dificuldade de respiração."),
              SizedBox(height: 5,),
              Text("Em caso de dúvida vá para um hospital o mais rápido possível.")
            ],
          ),
        ),
      ),
    );
  }
}
