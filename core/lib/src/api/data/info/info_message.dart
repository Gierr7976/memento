import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/data/message/message.dart';

class InfoMessage extends Message {
  List<User> reviewed;

  InfoMessage({
    required String uid,
    required User author,
    required DateTime created,
    required List<MessageData> editions,
    required this.reviewed,
  }) : super(
          uid: uid,
          author: author,
          created: created,
          editions: editions,
        );

  @override
  InfoMessage copyWith({
    String? uid,
    User? author,
    DateTime? created,
    List<MessageData>? editions,
    List<User>? reviewed,
  }) =>
      InfoMessage(
        uid: uid ?? this.uid,
        author: author ?? this.author,
        created: created ?? this.created,
        editions: editions ?? this.editions,
        reviewed: reviewed ?? this.reviewed,
      );
}
