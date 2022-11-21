import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/widgets/smart_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // lista de dispositivos
  List casaInteligente = [
    //! [dispositivoNome, dispositivoIcone, dispositivoStatus]

    ["Luz Sala", "lib/assets/icons/light-bulb.png", true],
    ["Ar", "lib/assets/icons/air-conditioner.png", false],
    ["TV", "lib/assets/icons/smart-tv.png", false],
    ["Fan", "lib/assets/icons/fan.png", false],
  ];

  // liga desliga
  void ligaDesliga(bool value, int index) {
    setState(() {
      casaInteligente[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //?  appbar personalizada
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 25.0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'lib/assets/icons/menu.png',
                      height: 45,
                      color: Colors.grey[800],
                    ),
                    Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.grey[800],
                    )
                  ]),
            ),
            const SizedBox(height: 20),
            //? Bem vindo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem vindo!',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    'Códices Systema',
                    style: GoogleFonts.bebasNeue(fontSize: 50),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(color: Colors.grey[400], thickness: 1),
            ),

            //? dispositivos smart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Dispositivos',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.grey[800]),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: casaInteligente.length,
                padding: const EdgeInsets.all(25),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.3,
                  crossAxisCount: 2,
                ),
                itemBuilder: ((context, index) {
                  return SmartItem(
                    nome: casaInteligente[index][0],
                    icone: casaInteligente[index][1],
                    ligado: casaInteligente[index][2],
                    onChanged: (value) => ligaDesliga(value, index),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
