// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_businesses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBusinessesResponse _$GetAllBusinessesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllBusinessesResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      mainImage: json['mainImage'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => Rooms.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Reviews.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBusinessesResponseToJson(
        GetAllBusinessesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'mainImage': instance.mainImage,
      'images': instance.images,
      'rooms': instance.rooms,
      'reviews': instance.reviews,
    };

Rooms _$RoomsFromJson(Map<String, dynamic> json) => Rooms(
      id: json['id'] as String,
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
      capacity: (json['capacity'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      duration: json['duration'] as String,
      openTime: json['openTime'] as String,
      closeTime: json['closeTime'] as String,
      difficulty: (json['difficulty'] as num).toInt(),
      pricePerPerson: (json['pricePerPerson'] as num).toInt(),
    );

Map<String, dynamic> _$RoomsToJson(Rooms instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'type': instance.type,
      'capacity': instance.capacity,
      'level': instance.level,
      'duration': instance.duration,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'difficulty': instance.difficulty,
      'pricePerPerson': instance.pricePerPerson,
    };

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews(
      username: json['username'] as String,
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'username': instance.username,
      'rating': instance.rating,
      'comment': instance.comment,
    };
