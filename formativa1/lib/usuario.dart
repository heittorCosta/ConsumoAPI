import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:formativa1/produto.dart';

class usuario extends StatefulWidget {
  const usuario({super.key});

  @override
  State<usuario> createState() => _usuarioState();
}

class _usuarioState extends State<usuario> {
String url = 'http://10.109.83.11:3000/users/';
TextEditingController prod = TextEditingController();
TextEditingController qtd = TextEditingController();
TextEditingController valor = TextEditingController();
_post() {
    Map<String, dynamic> produtos = {"id": 6, "nome": "${prod.text}", "valor": "${valor.text}", "quantidade": "${qtd.text}"};

    http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(produtos),
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => produto(
    nome: prod.text,
    qtd: qtd.text,
    valor: valor.text,
    )));

    // Navigator.push(context, MaterialPageRoute(builder: (context) => produto("${prod.text}", "${qtd.text}", "${valor.text}")));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
      ),
      body: Column(
        children: [
          TextField(
            controller: prod,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), hintText: 'Nome Produto'),
          ),
          TextField(
            controller: valor,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), hintText: 'Preço'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: qtd,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), hintText: 'Quantidade'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(onPressed: _post, child: Text('Cadastrar'))
        ],
      ),
    );
  }
}
