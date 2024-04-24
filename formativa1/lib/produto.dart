import 'package:flutter/material.dart';

class produto extends StatefulWidget {
  final String ?nome;
  final String ?qtd;
  final String ?valor;
  produto({super.key, this.nome, this.qtd, this.valor});

  @override
  State<produto> createState() => _produtoState();
}

class _produtoState extends State<produto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto"),
      ),
      body: Column(
        children: [
          Text("Nome: ${widget.nome}"),
          Text("Quantidade: ${widget.qtd}"),
          Text("Valor: ${widget.nome}")
        ],
      ),
    );
  }
}