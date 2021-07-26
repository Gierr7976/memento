import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/data/message/message.dart';

class Question extends Message {
  final User destination;
  final bool reviewed;

  Question({
    required String uid,
    required User author,
    required DateTime created,
    required List<MessageData> editions,
    required this.destination,
    this.reviewed = false,
  }) : super(
          uid: uid,
          author: author,
          created: created,
          editions: editions,
        );

  @override
  Question copyWith({
    String? uid,
    User? author,
    DateTime? created,
    List<MessageData>? editions,
    User? destination,
    bool? reviewed,
  }) =>
      Question(
        uid: uid ?? this.uid,
        author: author ?? this.author,
        created: created ?? this.created,
        editions: editions ?? this.editions,
        destination: destination ?? this.destination,
        reviewed: reviewed ?? this.reviewed,
      );
}
