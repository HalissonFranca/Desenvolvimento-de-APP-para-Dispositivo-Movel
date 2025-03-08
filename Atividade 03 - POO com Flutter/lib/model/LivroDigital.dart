import  'Livro.dart';
class LivroDigital extends Livro{
  double _tamanhoMB;

  LivroDigital(String titulo, String autor, int ano, this._tamanhoMB)
    : super(titulo, autor, ano);

  double get tamanhoMB => _tamanhoMB;

  @override
  String descrever(){
    return "${super.descrever()}, Tamanho: $_tamanhoMB";
    
  }
}