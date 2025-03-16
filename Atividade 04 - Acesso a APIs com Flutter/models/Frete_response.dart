class FreteResponse {
  final String servico;
  final String valor;
  final String prazo;

  FreteResponse({
    required this.servico,
    required this.valor,
    required this.prazo,
  });
  factory FreteResponse.fromJson(
      Map<String, dynamic> json, String servicoNome) {
    return FreteResponse(
      servico: servicoNome,
      valor: json['Valor'] ?? 'Indisponível',
      prazo: json['PrazoEntrega'] ?? 'Indisponível',
    );
  }
}
