import 'package:bank_gold/components/box_card.dart';
import 'package:bank_gold/screens/tela_cotacao/tela_cotacao.dart';
import 'package:bank_gold/screens/tela_principal/widgets/acoes_btn.dart';
import 'package:bank_gold/services/cotacao_services.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/7.png"), fit: BoxFit.cover)),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Material(
                color: Colors.transparent,
                child: BoxCard(
                    degrade: LinearGradient(
                        colors: [Colors.black, Colors.grey.shade600],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.2, 1]),
                    filho: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/imgs/logo.png",
                              height: 70,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Olá",
                                    style: TextStyle(
                                        color: Color.fromRGBO(218, 177, 88, 1),
                                        fontSize: 16)),
                                Text(
                                  "Aryelton",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(Icons.account_circle, size: 40),
                            ),
                            Column(
                              children: [
                                const Text("Saldo em conta:",
                                    style: TextStyle(
                                        color: Color.fromRGBO(218, 177, 88, 1),
                                        fontSize: 16)),
                                Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Text("R\$ ${1999.99}",
                                          style: TextStyle(fontSize: 18)),
                                    ),
                                    Icon(Icons.visibility)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const LinearProgressIndicator(
                          color: Color.fromRGBO(218, 177, 88, 1),
                          value: 0.5,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 20,
                  children: [
                    AcoesBtn(
                        texto: "Extrato",
                        funcao: () {
                          CotacaoService().verCotacao();
                        }),
                    AcoesBtn(texto: "Pagar", funcao: () {}),
                    AcoesBtn(texto: "Transferir", funcao: () {}),
                    AcoesBtn(texto: "Depositar", funcao: () {}),
                    AcoesBtn(texto: "Débito automático", funcao: () {}),
                    AcoesBtn(texto: "Usuário", funcao: () {}),
                    AcoesBtn(
                        texto: "Conversão de moedas",
                        funcao: () {
                          Navigator.pushNamed(context, "/cotacao");
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
