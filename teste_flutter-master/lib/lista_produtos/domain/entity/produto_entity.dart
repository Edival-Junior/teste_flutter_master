class Produto {
  String nome;
  String local;
  int quantidade;

  Produto({
    this.nome,
    this.local,
    this.quantidade,
  });

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        nome: json["nome"],
        local: json["local"],
        quantidade: json["quantidade"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "local": local,
        "quantidade": quantidade,
      };
}
