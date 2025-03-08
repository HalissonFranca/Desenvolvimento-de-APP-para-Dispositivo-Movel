// lib/views/home_page.dart
import 'package:flutter/material.dart';
import '../model/Livro.dart';
import '../model/LivroFisico.dart';
import '../model/LivroDigital.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Livro> livros = [
    LivroFisico("O Hobbit", "J.R.R. Tolkien", 1937, 310),
    LivroDigital("Clean Code", "Robert Martin", 2008, 5.2)
  ];
  int indiceAtual = 0;

  void alternarLivro() {
    setState(() {
      indiceAtual = (indiceAtual + 1) % livros.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDigital = livros[indiceAtual] is LivroDigital;

    return Scaffold(
      appBar: AppBar(
        title: Text("Biblioteca POO"),
        backgroundColor: isDigital ? Colors.blue : Colors.green,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: isDigital ? Colors.blue.shade100 : Colors.green.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                livros[indiceAtual].descrever(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: alternarLivro,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: isDigital ? Colors.blue : Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Alternar Livro",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
