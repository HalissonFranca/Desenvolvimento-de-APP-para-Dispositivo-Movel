import  'Livro.dart';
class LivroFisico extends Livro{
  int _numeroPaginas;

  LivroFisico(String titulo, String autor, int ano, this._numeroPaginas)
    : super(titulo, autor, ano);

  int get numeroPaginas => _numeroPaginas;

  @override
  String descrever(){
    return "${super.descrever()}, Páginas: $_numeroPaginas";
    
  }
}