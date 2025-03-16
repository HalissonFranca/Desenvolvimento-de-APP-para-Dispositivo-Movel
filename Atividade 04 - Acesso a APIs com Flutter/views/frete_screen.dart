import 'package:flutter/material.dart';
import '../controllers/frete_controller.dart';
import '../models/Frete_response.dart';

class FreteScreen extends StatefulWidget {
  @override
  _FreteScreenState createState() => _FreteScreenState();
}

class _FreteScreenState extends State<FreteScreen> {
  final TextEditingController cepOrigemController = TextEditingController();
  final TextEditingController cepDestinoController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController comprimentoController = TextEditingController();
  final TextEditingController larguraController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  // Inicializamos com um Future que retorna uma lista vazia
  Future<List<FreteResponse>> resultado = Future.value([]);

  // Função para calcular o frete de forma assíncrona
  Future<void> _calcularFrete() async {
    setState(() {
      resultado = FreteController().calcularFrete(
        cepOrigem: cepOrigemController.text,
        cepDestino: cepDestinoController.text,
        peso: pesoController.text,
        comprimento: comprimentoController.text,
        largura: larguraController.text,
        altura: alturaController.text,
      );
    });
  }

  // Função para limpar os campos de entrada
  void _limparCampos() {
    cepOrigemController.clear();
    cepDestinoController.clear();
    pesoController.clear();
    comprimentoController.clear();
    larguraController.clear();
    alturaController.clear();
    setState(() {
      resultado = Future.value([]); // Reinicia o resultado com uma lista vazia
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Frete - Loja Tech'),
        backgroundColor: const Color.fromARGB(255, 40, 211, 242),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: cepOrigemController,
                decoration: InputDecoration(labelText: 'CEP de Origem')),
            TextField(
                controller: cepDestinoController,
                decoration: InputDecoration(labelText: 'CEP de Destino')),
            TextField(
                controller: pesoController,
                decoration: InputDecoration(labelText: 'Peso (kg)')),
            TextField(
                controller: comprimentoController,
                decoration: InputDecoration(labelText: 'Comprimento (cm)')),
            TextField(
                controller: larguraController,
                decoration: InputDecoration(labelText: 'Largura (cm)')),
            TextField(
                controller: alturaController,
                decoration: InputDecoration(labelText: 'Altura (cm)')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _calcularFrete, child: Text('Calcular Frete')),
            ElevatedButton(
                onPressed: _limparCampos, child: Text('Limpar Campos')),
            SizedBox(height: 20),
            // Usamos o FutureBuilder para aguardar os dados do resultado
            FutureBuilder<List<FreteResponse>>(
              future: resultado, // Aqui passamos o resultado como Future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Indicador de carregamento
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}'); // Caso ocorra um erro
                } else if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!
                        .map((frete) => ListTile(
                              title: Text(frete.servico),
                              subtitle: Text(
                                  'Valor: R\$${frete.valor} - Prazo: ${frete.prazo} dias'),
                            ))
                        .toList(),
                  );
                } else {
                  return Text(
                      'Nenhum resultado encontrado.'); // Caso não haja dados
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Calculo Correios\t Fone: (62) 99374283',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
