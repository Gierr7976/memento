import 'package:flutter/widgets.dart';

/// "Мгновенная" длительность анимации, 200 мс.
const FLASH_ANIMATION_DURATION = Duration(milliseconds: 200);

/// Малая длительность анимации, 400 мс.
///
/// Используется в анимации изменения цвета, размера и т.п.
const SMALL_ANIMATION_DURATION = Duration(milliseconds: 400);

/// Средняя длительность анимации, 600 мс.
///
/// Используется в плавающих элементах и т.п.
const MEDIUM_ANIMATION_DURATION = Duration(milliseconds: 600);

/// Большая длительность анимации, 1200 мс.
///
/// Используется в переходах между страницами, слайдами и т.п.
const LONG_ANIMATION_DURATION = Duration(milliseconds: 1200);

/// Типичный радиус скругления элементов, используется в большинстве виджетов.
const GENERIC_BORDER_RADIUS = BorderRadius.all(Radius.circular(16));
