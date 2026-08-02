import 'package:flutter/material.dart';

void main() {
  runApp(const MeuPerfilApp());
}

class MeuPerfilApp extends StatelessWidget {
  const MeuPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil Dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PerfilDevPage(),
    );
  }
}

class PerfilDevPage extends StatelessWidget {
  const PerfilDevPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar com o título solicitado
      appBar: AppBar(
        title: const Text(
          'Meu Perfil Dev',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar com ícone de perfil
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // Nome do Desenvolvedor
              const Text(
                'Seu Nome Aqui',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                'Estudante de Desenvolvimento',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),

              const Divider(thickness: 1),
              const SizedBox(height: 16),

              // Linha: Turma
              const ItemInfoRow(
                icon: Icons.class_,
                label: 'Turma',
                value: 'T2DEV-T3',
              ),
              const SizedBox(height: 12),

              // Linha: Turno
              const ItemInfoRow(
                icon: Icons.nightlight_round,
                label: 'Turno',
                value: 'Noturno',
              ),
              const SizedBox(height: 12),

              // Linha: E-mail
              const ItemInfoRow(
                icon: Icons.email,
                label: 'E-mail',
                value: 'seu.email@exemplo.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget auxiliar para organizar cada linha de informação de forma limpa
class ItemInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ItemInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 10),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}