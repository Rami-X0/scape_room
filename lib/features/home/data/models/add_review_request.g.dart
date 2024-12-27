// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewRequest _$AddReviewRequestFromJson(Map<String, dynamic> json) =>
    AddReviewRequest(
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      businessId: json['businessId'] as String,
      roomId: json['roomId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$AddReviewRequestToJson(AddReviewRequest instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'businessId': instance.businessId,
      'roomId': instance.roomId,
      'userId': instance.userId,
      'userName': instance.userName,
    };
