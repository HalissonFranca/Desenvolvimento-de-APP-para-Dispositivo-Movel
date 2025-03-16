import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/Frete_response.dart';

class FreteController {
  Future<List<FreteResponse>> calcularFrete({
    required String cepOrigem,
    required String cepDestino,
    required String peso,
    required String comprimento,
    required String largura,
    required String altura,
  }) async {
    List<String> servicos = ['04014', '04510']; // SEDEX e PAC
    List<FreteResponse> resultados = [];

    for (String codigoServico in servicos) {
      final uri =
          Uri.parse('http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?'
              'nCdServico=$codigoServico'
              '&sCepOrigem=$cepOrigem'
              '&sCepDestino=$cepDestino'
              '&nVlPeso=$peso'
              '&nCdFormato=1'
              '&nVlComprimento=$comprimento'
              '&nVlLargura=$largura'
              '&nVlAltura=$altura'
              '&sCdMaoPropria=n'
              '&nVlValorDeclarado=0'
              '&sCdAvisoRecebimento=n'
              '&StrRetorno=json');

      try {
        final response = await http.get(uri);

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);

          // Verifica se a chave 'Servicos' existe e possui dados
          if (jsonData['Servicos'] != null &&
              jsonData['Servicos']['cServico'] != null) {
            // Itera sobre os serviços retornados
            final servicosData = jsonData['Servicos']['cServico'];

            for (var servico in servicosData) {
              // Adiciona cada serviço (SEDEX ou PAC) com os dados recebidos
              resultados.add(FreteResponse.fromJson(
                  servico, codigoServico == '04014' ? 'SEDEX' : 'PAC'));
            }
          } else {
            throw Exception('Dados de serviço não encontrados');
          }
        } else {
          throw Exception(
              'Erro ao buscar dados: Status Code ${response.statusCode}');
        }
      } catch (e) {
        // Captura de erro com detalhes
        print('Erro ao conectar com o servidor: $e');
        throw Exception('Falha na conexão: $e');
      }
    }
    return resultados;
  }
}
