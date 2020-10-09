import 'dart:convert';
import 'dart:io';

import 'package:teste_salcisne/lista_produtos/domain/entity/produto_entity.dart';
import 'package:http/http.dart' as http;

import '../domain/client/lista_produtos_client.dart';

class ProdutosClientImpl implements ProdutosClient {
  final String url = 'http://127.0.0.1:8080/produto/';
  var client = http.Client();

  List<Produto> produtos = [
    Produto(nome: "Produto 1", local: "Local A", quantidade: 20),
    Produto(nome: "Produto 2", local: "Local B", quantidade: 18),
    Produto(nome: "Produto 3", local: "Local C", quantidade: 16),
  ];

  @override
  Future<List<Produto>> getListaProdutos() async {
    return produtos;
    try {
      var _response = await client.get(url + 'find-all');
      if (_response.statusCode == HttpStatus.ok) {
        final _json = json.decode(_response.body);
        return _json
            .map<Produto>((_produtoJson) => Produto.fromJson(_produtoJson))
            .toList(growable: true);
      } else {
        throw http.ClientException("Houve um erro na requisição");
      }
    } catch (e) {
      throw http.ClientException("Erro inesperado");
    }
  }
}
