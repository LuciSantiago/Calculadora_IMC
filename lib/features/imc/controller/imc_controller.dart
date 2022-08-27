import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'imc_state.dart';
part 'imc_controller.freezed.dart';

class ImcController extends Cubit<ImcState> {
  ImcController() : super(ImcState.initial());

  bool masculino = false;
  bool feminino = false;
  int alturaC = 170;
  int pesoC = 60;
  int idade = 18;
  double imcC = 0.0;
  String classificacao = '';
  String feedBack = '';

  void reset() {
    masculino = false;
    feminino = false;
    alturaC = 170;
    pesoC = 60;
    idade = 18;
    emit(ImcState.resetState(resete: true));
  }

  void updateState() {
    emit(ImcState.upddate(update: true));
  }

  void masculinoSelecionado() {
    feminino = false;
    masculino = !masculino;
    emit(ImcState.genero());
    updateState();
  }

  void femininoSelecionado() {
    feminino = !feminino;
    masculino = false;
    emit(ImcState.genero());
    updateState();
  }

  void alturaSelecionada({required int altura}) {
    alturaC = altura;
    emit(ImcState.altura());
    updateState();
  }

  void pesoSelecionado({required int peso}) {
    pesoC = peso;
    emit(ImcState.peso(peso: peso));
    updateState();
  }

  void idadeIncrement() {
    emit(ImcState.increment(idade: idade++));
    updateState();
  }

  void idadeDecrement() {
    emit(ImcState.decrement(idade: idade--));
    updateState();
  }

  void calcularImc() {
    var alturaConvertida = alturaC / 100;
    var imcCalcular = pesoC / ((alturaConvertida * alturaConvertida));
    imcC = double.parse(imcCalcular.toStringAsFixed(2));

    if (imcC < 18.5) {
      classificacao = 'Magreza';
      feedBack = 'Fadiga, stress, ansiedade';
    } else if (imcC > 18.5 && imcC < 24.9) {
      classificacao = 'Peso normal';
      feedBack = 'Menor risco de doenças cardíacas e vasculares';
    } else if (imcC > 25 && imcC < 29.9) {
      classificacao = 'Sobrepeso';
      feedBack = 'Fadiga, má circulação, varizes';
    } else if (imcC > 30 && imcC < 34.9) {
      classificacao = 'Obesidade grau I';
      feedBack = 'Diabetes, angina, infarto, aterosclerose';
    } else if (imcC > 35 && imcC < 39.9) {
      classificacao = 'Obesidade grau II';
      feedBack = 'Apneia do sono, falta de ar';
    } else if (imcC > 40) {
      classificacao = 'Obesidade grau III';
      feedBack =
          'Refluxo, dificuldade para se mover, escaras, diabetes, infarto, AVC';
    }
    updateState();
  }
}
