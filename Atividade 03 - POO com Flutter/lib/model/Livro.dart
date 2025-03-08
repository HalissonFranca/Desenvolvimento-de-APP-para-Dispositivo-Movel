class Livro{
  String _titulo;
  String _autor;
  int _ano;

  Livro(this._titulo, this._autor, this._ano);

  String get titulo => _titulo;
  String get autor => _autor;
  int get ano => _ano;

  String descrever(){
    return "Titulo: $_titulo, Autor: $_autor, Ano: $_ano";
  }

}