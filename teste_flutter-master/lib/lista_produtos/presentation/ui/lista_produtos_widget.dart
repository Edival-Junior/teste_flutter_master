import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_salcisne/lista_produtos/data/lista_produtos_client_impl.dart';
import 'package:teste_salcisne/lista_produtos/domain/entity/produto_entity.dart';

import '../bloc/lista_produtos_bloc.dart';

class ListaProdutosWidget extends StatelessWidget {
  const ListaProdutosWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de produtos')),
      body: Center(
        child: BlocBuilder<ListaProdutosBloc, ListaProdutosState>(
          builder: (context, state) {
            if (state is ListaProdutosInitial) {
            } else if (state is Error) {
            } else if (state is Loading) {
            } else if (state is ListaCarregada) {}

            var listaProdutos = ProdutosClientImpl().getListaProdutos();
            return Container(
              child: FutureBuilder(
                future: listaProdutos,
                builder: (context, snapshot) => {
                  if (snapshot.hasData)
                    {
                      Center(
                        child: Text(snapshot.data),
                      )
                    }
                  else if (snapshot.hasError)
                    {
                      Center(
                        child: Text(snapshot.error),
                      )
                    }
                  else if (!snapshot.hasData)
                    {
                      Center(
                        child: Text('Nenhum dado encontrado'),
                      )
                    }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
