import 'package:json_annotation/json_annotation.dart';

part 'add_review_request.g.dart';

@JsonSerializable()
class AddReviewRequest {
  final int rating;
  final String comment, businessId, roomId, userId, userName;

  AddReviewRequest({
    required this.rating,
    required this.comment,
    required this.businessId,
    required this.roomId,
    required this.userId,
    required this.userName,
  });

Map<String, dynamic> toJson() => _$AddReviewRequestToJson(this);
}
