import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/data/prototype/prototype.dart';

/// Базовая абстракция группы, включающая в себя элементы, присущие любой группе,
/// будь то структурообразующая группа или отряд.
abstract class Group extends Prototype {
  final String name;
  final User administrator;
  final List<User> users;

  Group({
    required String uid,
    required this.name,
    required this.administrator,
    this.users = const [],
  }) : super(
          uid: uid,
        );

  @override
  Group copyWith({
    String? uid,
    String? name,
    User? administrator,
    List<User>? users,
  });
}
