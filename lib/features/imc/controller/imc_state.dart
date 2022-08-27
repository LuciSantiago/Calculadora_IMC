part of 'imc_controller.dart';

@freezed
class ImcState with _$ImcState {
  factory ImcState.initial() = _Initial;
  factory ImcState.upddate({required bool update}) = _Update;
  factory ImcState.genero() = _Genero;
  factory ImcState.increment({required int idade}) = _Increment;
  factory ImcState.decrement({required int idade}) = _Decrement;
  factory ImcState.peso({required int peso}) = _Peso;
  factory ImcState.altura() = _Altura;

  factory ImcState.resetState({required bool resete}) = _Reset;
}
