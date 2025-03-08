import '../model/Livro.dart';
import '../model/LivroFisico.dart';
import '../model/LivroDigital.dart';
import 'package:flutter/material.dart';

class LivroViewModel extends ChangeNotifier{
  List<Livro> _livros = [
    LivroFisico("O Hobbit", "J.R.R. Tolkien", 1937, 310),
    LivroDigital("Clean Code", "Robert Martin", 2008, 5.2)
  ];

  int _indiceAtual = 0;

  Livro get livroAtual => _livros[_indiceAtual];

  void alternarLivro(){
    _indiceAtual = (_indiceAtual + 1) % _livros.length;
    notifyListeners();
  } 
}