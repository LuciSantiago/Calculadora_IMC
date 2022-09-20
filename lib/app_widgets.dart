import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/imc/controller/imc_controller.dart';
import 'features/imc/imc_page.dart';

class AppWidgets extends StatelessWidget {
  const AppWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => ImcController(),
              child: const ImcPage(),
            ),
      },
      initialRoute: '/',
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
