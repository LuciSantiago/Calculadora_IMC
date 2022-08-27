import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'controller/imc_controller.dart';
import 'widgets/custom_card.dart';

class ImcPage extends StatelessWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = context.read<ImcController>();
    return BlocListener<ImcController, ImcState>(
      listenWhen: (previous, current) {
        return current.maybeWhen(
          orElse: () => false,
          upddate: (update) => true,
          resetState: (resete) => true,
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => false,
          upddate: (update) => true,
          resetState: (resete) => true,
        );
      },
      child: BlocBuilder<ImcController, ImcState>(
        builder: (context, state) {
          state.maybeWhen(
            orElse: () => false,
            upddate: (update) => true,
            resetState: (resete) => true,
          );
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      controller.reset();
                    },
                    icon: const Icon(Icons.refresh)),
              ],
              title: const Text('Imc'),
            ),
            body: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.masculinoSelecionado();
                      },
                      child: CustomCard(
                        //height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.47,
                        borderSide: BorderSide(
                          color: controller.masculino
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.male,
                              color: Colors.blue,
                              size: 70,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Masculino',
                              style: GoogleFonts.lato(
                                fontSize: 22,
                                fontWeight: controller.masculino
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.femininoSelecionado();
                      },
                      child: CustomCard(
                        width: MediaQuery.of(context).size.width * 0.47,
                        borderSide: BorderSide(
                          color: controller.feminino
                              ? Colors.pink
                              : Colors.transparent,
                          width: 2,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.female,
                              color: Colors.pink,
                              size: 70,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Feminino',
                              style: GoogleFonts.lato(
                                  fontSize: 22,
                                  fontWeight: controller.feminino
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomCard(
                    width: 370,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Altura em cm',
                          style: GoogleFonts.lato(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        NumberPicker(
                          minValue: 120,
                          maxValue: 220,
                          value: controller.alturaC,
                          onChanged: (newValue) {
                            controller.alturaSelecionada(altura: newValue);
                          },
                          selectedTextStyle: GoogleFonts.roboto(
                              fontSize: 26,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                          axis: Axis.horizontal,
                          itemCount: 5,
                          itemWidth: 60,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                              5,
                              (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 29, vertical: 10),
                                    height: index == 2 ? 30 : 17,
                                    width: 3,
                                    color: index == 2
                                        ? Colors.black
                                        : Colors.grey[400],
                                  )),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Peso',
                              style: GoogleFonts.lato(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.10),
                                  border: Border.all(
                                      width: 2,
                                      color: Colors.grey.withOpacity(.3)),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  const Positioned(
                                    bottom: 60,
                                    child: RotatedBox(
                                      quarterTurns: 45,
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: NumberPicker(
                                      minValue: 10,
                                      maxValue: 150,
                                      value: controller.pesoC,
                                      onChanged: (value) {
                                        controller.pesoSelecionado(peso: value);
                                      },
                                      itemWidth: 40,
                                      selectedTextStyle: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                      axis: Axis.horizontal,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomCard(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Idade',
                              style: GoogleFonts.lato(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.idadeDecrement();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.13),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.white54, width: 0)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  controller.idade.toString(),
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.idadeIncrement();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.13),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.white54, width: 0)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  width: 140,
                  child: ElevatedButton.icon(
                    label: const Text(
                      'Calcular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    icon: const Icon(
                      Icons.calculate_sharp,
                      size: 22,
                      color: Colors.white,
                    ),
                    //style: const ButtonStyle(fixedSize: 30),
                    //backgroundColor: Colors.white,
                    //shape: const CircleBorder(),
                    //child: const Text('Calcular'),
                    onPressed: () {
                      controller.calcularImc();
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return BottomSheet(
                                onClosing: () {},
                                builder: (context) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 50),
                                    height: 200,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                              color:
                                                  Colors.black.withOpacity(.8)),
                                        ),
                                        Text(
                                          'Riscos: ${controller.feedBack}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 1.5,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(.8)),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Fechar',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        )
                                      ],
                                    )),
                                  );
                                });
                          });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
