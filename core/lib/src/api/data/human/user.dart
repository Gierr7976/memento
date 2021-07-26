import 'package:memento_core/src/api/data/human/human.dart';

class User extends Human {
  final String shortName;
  final String nickname;
  final String phoneNumber;
  final PreferredName preferredName;

  User({
    required String uid,
    required String lastName,
    required String firstName,
    required String patronym,
    required DateTime birthDate,
    required this.shortName,
    required this.nickname,
    required this.phoneNumber,
    required this.preferredName,
  }) : super(
          uid: uid,
          lastName: lastName,
          firstName: firstName,
          patronym: patronym,
          birthDate: birthDate,
        );

  @override
  User copyWith({
    String? uid,
    String? lastName,
    String? firstName,
    String? patronym,
    DateTime? birthDate,
    String? shortName,
    String? nickname,
    String? phoneNumber,
    PreferredName? preferredName,
  }) =>
      User(
        uid: uid ?? this.uid,
        lastName: lastName ?? this.lastName,
        firstName: firstName ?? this.firstName,
        patronym: patronym ?? this.patronym,
        birthDate: birthDate ?? this.birthDate,
        shortName: shortName ?? this.shortName,
        nickname: nickname ?? this.nickname,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        preferredName: preferredName ?? this.preferredName,
      );
}

enum PreferredName { firstAndPatronym, short, full, nick }
