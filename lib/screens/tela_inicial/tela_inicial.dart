import 'package:bank_gold/components/btn_ink.dart';
import 'package:bank_gold/components/btn_primario.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/2.png"), fit: BoxFit.cover)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset(
                "assets/imgs/logo.png",
                height: 170,
              ),
              Text(
                "BANK GOLD",
                style: GoogleFonts.montserrat(
                    fontSize: 26,
                    color: const Color.fromRGBO(218, 177, 88, 1),
                    decoration: TextDecoration.none),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Bem vindo(a)",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {},
                  child: const BtnInk(
                      texto: "Abrir conta",
                      cor: Colors.white,
                      icon: null,
                      corTexto: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/principal");
                    },
                    child: const BtnInk(
                        texto: "Já tenho conta",
                        cor: Colors.white,
                        icon: null,
                        corTexto: Colors.black),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, bottom: 5),
                child: Text("Conheça os beneficiçios"),
              ),
              const Icon(Icons.arrow_downward),
            ],
          ),
        ),
      ),
    );
  }
}
