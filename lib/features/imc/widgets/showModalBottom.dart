import 'package:flutter/material.dart';

import '../controller/imc_controller.dart';

Future<dynamic> showModalBottom(
    BuildContext context, ImcController controller) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                height: 200,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Seu imc é: ${controller.imcC}',
                      style: const TextStyle(
                        //height: 1.5,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Resultado: ${controller.classificacao}',
                      style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black.withOpacity(.8)),
                    ),
                    Text(
                      'Riscos: ${controller.feedBack}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black.withOpacity(.8)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Fechar',
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                )),
              );
            });
      });
}
