import 'package:memento_core/src/api/data/camp/shift.dart';
import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/data/prototype/prototype.dart';

class Invite extends Prototype {
  final User author;
  final DateTime dateTime;
  final Shift shift;

  Invite({
    required this.author,
    required this.dateTime,
    required String uid,
    required this.shift,
  }) : super(
          uid: uid,
        );

  @override
  Invite copyWith({
    String? uid,
    User? author,
    DateTime? dateTime,
    Shift? shift,
  }) =>
      Invite(
        uid: uid ?? this.uid,
        author: author ?? this.author,
        dateTime: dateTime ?? this.dateTime,
        shift: shift ?? this.shift,
      );
}
