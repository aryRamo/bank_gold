import 'dart:ffi';

import 'package:bank_gold/components/box_card.dart';
import 'package:flutter/material.dart';

class AcoesBtn extends StatelessWidget {
  final String texto;
  final VoidCallback funcao;
  const AcoesBtn({super.key, required this.texto, required this.funcao});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 100,
        width: 100,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: funcao,
          child: BoxCard(
            filho: Center(
              child: Text(
                texto,
                maxLines: 2,
              ),
            ),
            degrade: const LinearGradient(
                colors: [Colors.black, Color.fromRGBO(218, 177, 88, 1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.2, 1]),
          ),
        ),
      ),
    );
  }
}
