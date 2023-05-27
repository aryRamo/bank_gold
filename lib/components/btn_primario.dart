import 'package:flutter/material.dart';

class BtnPrimario extends StatelessWidget {
  final BuildContext context;
  final String texto;
  final Color? cor;
  final Widget? icon;
  final Function funcao;
  final Color corTexto;
  final bool borda;

  const BtnPrimario(
      {super.key,
      required this.context,
      required this.texto,
      required this.cor,
      required this.icon,
      required this.funcao,
      required this.corTexto,
      this.borda = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onHover: (value) {},
        onPressed: () => funcao(),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
            backgroundColor: cor,
            shape: RoundedRectangleBorder(
                side: (borda == true)
                    ? const BorderSide(width: 1, color: Colors.grey)
                    : const BorderSide(),
                borderRadius: BorderRadius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: icon,
            ),
            Text(texto, style: TextStyle(color: corTexto)),
          ],
        ),
      ),
    );
  }
}
