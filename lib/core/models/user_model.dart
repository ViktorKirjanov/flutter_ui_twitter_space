import 'package:equatable/equatable.dart';

import '../enums/mic_status_enum.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String role;
  final String img;
  final MicStatus micStatus;

  const User({
    required this.uid,
    required this.name,
    required this.role,
    required this.img,
    required this.micStatus,
  });

  @override
  List<Object?> get props => [uid, name, role, img, micStatus];
}
