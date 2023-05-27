import 'package:bank_gold/components/box_card.dart';
import 'package:bank_gold/components/btn_ink.dart';
import 'package:bank_gold/services/cotacao_services.dart';
import 'package:flutter/material.dart';

class TelaCotacao extends StatefulWidget {
  const TelaCotacao({super.key});

  @override
  State<TelaCotacao> createState() => _TelaCotacaoState();
}

class _TelaCotacaoState extends State<TelaCotacao> {
  final _formKey = GlobalKey<FormState>();
  var realController = TextEditingController();
  double euro = 0.0;
  double dolar = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(19, 16, 19, 1),
          ),
          body: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/imgs/7.png"), fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Material(
                        color: Colors.transparent,
                        child: BoxCard(
                          degrade: LinearGradient(
                              colors: [Colors.black, Colors.grey.shade600],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: const [0.2, 1]),
                          filho: Row(
                            children: [
                              Image.asset("assets/imgs/logo.png", height: 70),
                              const Text(
                                "Conversor de moedas",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(218, 177, 88, 1)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: BoxCard(
                        degrade: const LinearGradient(
                            colors: [
                              Colors.black,
                              Color.fromRGBO(218, 177, 88, 1)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.2, 1]),
                        filho: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                "Real",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Text("R\$"),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: TextFormField(
                                        maxLines: 1,
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return "insira algum valor";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: realController,
                                        keyboardType: TextInputType.number,
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Material(
                        color: Colors.transparent,
                        child: BoxCard(
                          degrade: const LinearGradient(
                              colors: [
                                Colors.black,
                                Color.fromRGBO(218, 177, 88, 1)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.2, 1]),
                          filho: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                child: Text(
                                  "Euro",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Text("€"),
                                  Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text("$euro")),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: BoxCard(
                        degrade: const LinearGradient(
                            colors: [
                              Colors.black,
                              Color.fromRGBO(218, 177, 88, 1)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.2, 1]),
                        filho: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                "Dolar",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Text("\$"),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text("$dolar")),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              double real = double.parse(realController.text);

                              Map<String, dynamic> cotacao =
                                  await CotacaoService().verCotacao();

                              double dolarResposta =
                                  real / cotacao["USD"]["buy"];
                              double euroResposta =
                                  real / cotacao["EUR"]["buy"];

                              String dolarFormatado =
                                  dolarResposta.toStringAsFixed(2);
                              String euroFormatado =
                                  euroResposta.toStringAsFixed(2);

                              setState(() {
                                euro = double.parse(euroFormatado);
                                dolar = double.parse(dolarFormatado);
                              });
                            }
                          },
                          child: const BtnInk(
                              texto: "Converter",
                              cor: Colors.white,
                              icon: null,
                              corTexto: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
