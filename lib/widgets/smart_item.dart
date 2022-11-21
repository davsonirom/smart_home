// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartItem extends StatelessWidget {
  SmartItem({
    Key? key,
    required this.nome,
    required this.icone,
    required this.ligado,
    required this.onChanged,
  }) : super(key: key);

  final String nome;
  final String icone;
  final bool ligado;
  void Function(bool) onChanged; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: ligado ? Colors.grey[900] : Colors.grey[400], borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //? icone
                Image.asset(
                  icone,
                  height: 65,
                  color: ligado ? Colors.white : Colors.black,
                ),
                //? nome e status
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        nome,
                        style:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20, color: ligado ? Colors.white : Colors.black),
                      ),
                    )),
                    Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                        value: ligado,
                        onChanged: onChanged,
                        trackColor: Colors.red[200],
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
