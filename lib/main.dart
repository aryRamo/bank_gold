import 'package:bank_gold/screens/tela_cotacao/tela_cotacao.dart';
import 'package:bank_gold/screens/tela_inicial/tela_inicial.dart';
import 'package:bank_gold/screens/tela_principal/tela_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Gold',
      theme: ThemeData.dark(),
      initialRoute: "/inicial",
      routes: {
        "/inicial": (context) => const TelaInicial(),
        "/principal": (context) => const TelaPrincipal(),
        "/cotacao": (context) => const TelaCotacao()
      },
    );
  }
}
