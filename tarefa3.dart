import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaCadastro(),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  // 1. Criação dos controladores para capturar o texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _profissaoController = TextEditingController();

  // Variáveis para armazenar os valores e exibir no Card
  String _nome = '';
  String _profissao = '';
  bool _exibirCard = false;

  // Limpeza dos controladores para liberar memória quando a tela for descartada
  @override
  void dispose() {
    _nomeController.dispose();
    _profissaoController.dispose();
    super.dispose();
  }

  // Função chamada ao clicar no botão
  void _cadastrar() {
    setState(() {
      _nome = _nomeController.text;
      _profissao = _profissaoController.text;

      // Exibe o card apenas se o usuário preencheu o nome
      if (_nome.isNotEmpty) {
        _exibirCard = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Interativo'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAlignment.stretch,
          children: [
            // Campo 1: Nome
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),

            // Campo 2: Profissão / Cargo Desejado
            TextFormField(
              controller: _profissaoController,
              decoration: const InputDecoration(
                labelText: 'Profissão / Cargo Desejado',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
              ),
            ),
            const SizedBox(height: 20),

            // Botão de Ação
            ElevatedButton(
              onPressed: _cadastrar,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Cadastrar',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),

            // Card de Boas-vindas (exibido apenas após o clique se preenchido)
            if (_exibirCard)
              Card(
                elevation: 4,
                color: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Bem-vindo(a), $_nome!',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Cargo cadastrado: $_profissao',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}