import 'package:flutter/material.dart';

void main() {
  runApp(const ListaProdutosApp());
}

class ListaProdutosApp extends StatelessWidget {
  const ListaProdutosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Produtos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ListaProdutosPage(),
    );
  }
}

// Modelo de dados para os produtos
class Produto {
  final String titulo;
  final String descricao;
  final double preco;
  final IconData icone;

  const Produto({
    required this.titulo,
    required this.descricao,
    required this.preco,
    required this.icone,
  });
}

class ListaProdutosPage extends StatelessWidget {
  const ListaProdutosPage({super.key});

  // Lista mockada de produtos para alimentar o ListView.builder
  final List<Produto> produtos = const [
    Produto(
      titulo: 'Notebook Gamer',
      descricao: 'Processador i7, 16GB RAM, SSD 512GB com placa dedicada.',
      preco: 4500.00,
      icone: Icons.laptop_mac,
    ),
    Produto(
      titulo: 'Smartphone Pro',
      descricao: 'Tela AMOLED 120Hz, 128GB de armazenamento e câmera tripla.',
      preco: 2800.00,
      icone: Icons.smartphone,
    ),
    Produto(
      titulo: 'Fone Bluetooth Noise Cancelling',
      descricao: 'Cancelamento ativo de ruído e bateria com até 30 horas de duração.',
      preco: 350.00,
      icone: Icons.headphones,
    ),
    Produto(
      titulo: 'Smartwatch Sport',
      descricao: 'Monitoramento cardíaco, GPS integrado e resistente à água.',
      preco: 600.00,
      icone: Icons.watch,
    ),
    Produto(
      titulo: 'Teclado Mecânico RGB',
      descricao: 'Switches azuis, iluminação RGB customizável e layout ABNT2.',
      preco: 250.00,
      icone: Icons.keyboard,
    ),
    Produto(
      titulo: 'Mouse Sem Fio Ergonômico',
      descricao: 'Sensor de alta precisão até 16000 DPI e design ergonômico.',
      preco: 180.00,
      icone: Icons.mouse,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      // Utilização do ListView.builder para renderizar a lista dinâmica
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          // Cada item renderizado dentro de um Card com ListTile
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12.0),
              // Ícone lateral esquerdo (leading)
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.teal.shade50,
                child: Icon(
                  produto.icone,
                  color: Colors.teal,
                  size: 28,
                ),
              ),
              // Título do Produto
              title: Text(
                produto.titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // Breve descrição
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  produto.descricao,
                  maxLines: 2, // Limita linhas para evitar quebras visuais em telas pequenas
                  overflow: TextOverflow.ellipsis, // Adiciona "..." se o texto for muito longo
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                  ),
                ),
              ),
              // Preço do Produto no lado direito (trailing)
              trailing: Text(
                'R\$ ${produto.preco.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                // Ação opcional ao clicar no Card
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selecionado: ${produto.titulo}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}