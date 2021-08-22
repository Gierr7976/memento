import 'package:flutter_bloc/flutter_bloc.dart';

/// Направление пролистывания.
enum SliderDirection { prev, next }

/// Состояние слайдера.
class SliderState {
  /// Индекс текущего слайда.
  final int slide;

  /// Индекс предыдущего слайда.
  final int? prevSlide;

  /// Направление, в котором совершается пролистывание.
  SliderDirection get direction => prevSlide != null
      ? slide > prevSlide!
          ? SliderDirection.next
          : SliderDirection.prev
      : SliderDirection.next;

  /// Базовый конструктор.
  SliderState({
    this.slide = 0,
    this.prevSlide,
  });
}

/// [Cubit], управляющий пролистыванием.
///
/// Допускает слайды с индексами от 0 до [maxSlide] включительно.
class SliderCubit extends Cubit<SliderState> {
  /// Индекс последнего слайда.
  final int maxSlide;

  /// Базовый конструктор.
  SliderCubit({required this.maxSlide}) : super(SliderState());

  /// Перелистывает до следующего слайда, если это возможно.
  void scrollNext() {
    if (state.slide < maxSlide)
      emit(
        SliderState(
          slide: state.slide + 1,
          prevSlide: state.slide,
        ),
      );
  }

  /// Перелистывает до предыдущего слайда, если это возможно.
  void scrollPrev() {
    if (state.slide > 0)
      emit(
        SliderState(
          slide: state.slide - 1,
          prevSlide: state.slide,
        ),
      );
  }

  /// Перелистывает до слайда с индексом [slide], если это возможно.
  void jump(int slide) {
    if (slide != state.slide && slide >= 0 && slide <= maxSlide)
      emit(
        SliderState(
          slide: slide,
          prevSlide: state.slide,
        ),
      );
  }
}
