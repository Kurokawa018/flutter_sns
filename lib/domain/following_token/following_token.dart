import 'package:freezed_annotation/freezed_annotation.dart';


part 'following_token.freezed.dart';
part 'following_token.g.dart';

@freezed
abstract class FollowingToken with _$FollowingToken {
  //DBに保存する
  //createdAtやIDが必要
  //自分がフォローしたことの印
  const factory FollowingToken({
    required dynamic createdAt,
    required String passiveUid,
    required String tokenId,
  }) = _FollowingToken;
  factory FollowingToken.fromJson(Map<String, dynamic> json) => _$FollowingTokenFromJson(json);
}