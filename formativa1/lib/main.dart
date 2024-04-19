import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:formativa1/usuario.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
TextEditingController login = TextEditingController();
TextEditingController pass = TextEditingController();

String url = 'http://10.109.83.11:3000/users/1';

_login() async {
     
    
    http.Response resposta = await http.get(Uri.parse(url));
    var dado = jsonDecode(resposta.body);
    print(dado);
    
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        width: 500,
        height: 500,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Insira seu email',
                hintText: 'email@proverdor.com'
              ),
              controller: login,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Senha',
              ),
              controller: pass,
            ),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => usuario()));}, child: Text('Mudar Tela'))
          ],
        ),
      ),
    );
  }
}