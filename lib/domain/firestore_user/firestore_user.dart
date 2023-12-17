import 'package:freezed_annotation/freezed_annotation.dart';


part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';

@freezed
abstract class FirestoreUser with _$FirestoreUser {
  const factory FirestoreUser({
    required dynamic createdAt,
    required dynamic updatadAt,
    required String email,
    required int followerCount,
    required int followingCount,
    required String userName,
    required String uid,
    required String userImageURL,
  }) = _FirestoreUser;
  factory FirestoreUser.fromJson(Map<String, dynamic> json) => _$FirestoreUserFromJson(json);
}