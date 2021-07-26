import 'package:memento_core/src/api/data/prototype/prototype.dart';

/// Базовая абстракция человека, включаящая в себя элементы, присущие любому
/// человеку, будь то вожатый, внеотряд или ребёнок.
abstract class Human extends Prototype {
  final String lastName;
  final String firstName;
  final String patronym;
  final DateTime birthDate;

  Human({
    required String uid,
    required this.lastName,
    required this.firstName,
    required this.patronym,
    required this.birthDate,
  }) : super(
          uid: uid,
        );

  @override
  Human copyWith({
    String? uid,
    String? lastName,
    String? firstName,
    String? patronym,
    DateTime? birthDate,
  });
}
