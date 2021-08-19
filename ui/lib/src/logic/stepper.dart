import 'package:flutter_bloc/flutter_bloc.dart';

enum SliderDirection { prev, next }

class SliderState {
  final int slide;
  final int? prevSlide;

  SliderDirection get direction => prevSlide != null
      ? slide > prevSlide!
          ? SliderDirection.next
          : SliderDirection.prev
      : SliderDirection.next;

  SliderState({
    this.slide = 0,
    this.prevSlide,
  });
}

class SliderCubit extends Cubit<SliderState> {
  final int maxSlide;

  SliderCubit({required this.maxSlide}) : super(SliderState());

  void scrollNext() {
    if (state.slide < maxSlide)
      emit(
        SliderState(
          slide: state.slide + 1,
          prevSlide: state.slide,
        ),
      );
  }

  void scrollPrev() {
    if (state.slide > 0)
      emit(
        SliderState(
          slide: state.slide - 1,
          prevSlide: state.slide,
        ),
      );
  }

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
