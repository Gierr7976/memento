import 'package:memento_core/src/api/data/group/group.dart';
import 'package:memento_core/src/api/data/group/structural_group.dart';
import 'package:memento_core/src/api/data/human/user.dart';

class Shift extends StructuralGroup {
  final DateTime start;
  final DateTime end;

  Shift({
    required String uid,
    required String name,
    required User administrator,
    List<User> users = const [],
    List<Group> subGroups = const [],
    required this.start,
    required this.end,
  }) : super(
          uid: uid,
          name: name,
          administrator: administrator,
          users: users,
          subGroups: subGroups,
        );

  @override
  Shift copyWith({
    String? uid,
    String? name,
    User? administrator,
    List<User>? users,
    List<Group>? subGroups,
    DateTime? start,
    DateTime? end,
  }) =>
      Shift(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        administrator: administrator ?? this.administrator,
        users: users ?? this.users,
        subGroups: subGroups ?? this.subGroups,
        start: start ?? this.start,
        end: end ?? this.end,
      );
}
