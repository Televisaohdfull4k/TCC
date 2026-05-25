import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc_project/presentation/screens/choose_perspective_screen.dart';

void main() {
  runApp(const MindBridgeApp());
}

class MindBridgeApp extends StatelessWidget {
  const MindBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindBridge App',
      debugShowCheckedModeBanner: false, // Remove a faixa de 'DEBUG' no canto
      theme: ThemeData(
        useMaterial3: true,
        // Aplica a fonte Inter globalmente para o design limpo
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      // Aqui dizemos para o app abrir a nossa tela criada, e não mais o contador
      home: ChoosePerspectiveScreen(),
    );
  }
}
